package com.tech.gulimall.product.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.google.common.base.Splitter;
import com.tech.gulimall.common.exception.BizException;
import com.tech.gulimall.common.utils.BeanUtils;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.common.utils.Query;
import com.tech.gulimall.common.utils.StringUtils;
import com.tech.gulimall.product.dao.CategoryDao;
import com.tech.gulimall.product.entity.po.CategoryEntity;
import com.tech.gulimall.product.entity.vo.Catalog2Vo;
import com.tech.gulimall.product.service.CategoryBrandRelationService;
import com.tech.gulimall.product.service.CategoryService;
import org.apache.commons.beanutils.ConvertUtils;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.data.redis.core.script.DefaultRedisScript;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

@Service("categoryService")
public class CategoryServiceImpl extends ServiceImpl<CategoryDao, CategoryEntity> implements CategoryService {

    private final static Integer ROOT_LEVEL = 1;

    private final static Integer PID_OF_LEVEL_1 = 0;

    private final static String LOCK = "lock";

    @Autowired
    private CategoryBrandRelationService categoryBrandRelationService;

    @Autowired
    private StringRedisTemplate redisTemplate;

    @Autowired
    private RedissonClient redisson;



    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<CategoryEntity> page = this.page(
                new Query<CategoryEntity>().getPage(params),
                new QueryWrapper<CategoryEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public List<CategoryEntity> queryListTreeByRecursion(){
        List<CategoryEntity> categoryEntities = new ArrayList<>(1000);
        List<CategoryEntity> dbCategoryList = baseMapper.selectList(null);
        for (CategoryEntity category : dbCategoryList) {
            if(ROOT_LEVEL.equals(category.getCatLevel())){
                categoryEntities.add(category);
            }
        }

        for (CategoryEntity categoryEntity : categoryEntities) {
            categoryEntity.setChildren(getChildren(categoryEntity.getCatId(),dbCategoryList));
        }

        return categoryEntities;
    }

    private List<CategoryEntity> getChildren (Long parentId, List<CategoryEntity> categoryEntities) {
        List<CategoryEntity> children = new ArrayList<>(1000);

        for (CategoryEntity categoryEntity : categoryEntities) {
            if (parentId.equals(categoryEntity.getParentCid()) ) {
                children.add(categoryEntity);
            }
        }

        // 递归遍历二级菜单
        for (CategoryEntity category : children) {
            category.setChildren(getChildren(category.getCatId(),categoryEntities));
        }
        return children;
    }

    @Override
    public List<CategoryEntity> queryListTreeByFor() {
        List<CategoryEntity> dbCategoryList = baseMapper.selectList(null);
        return sortParentAndChild(dbCategoryList, true);
    }

    /** 
    * @Description: 很好的菜单树算法
    * @Param: [entities, treeMenu] treeMenu 是否以菜单树形式返回
    * @return: java.util.List<com.tech.gulimall.product.entity.CategoryEntity> 
    * @Author: phil 
    * @Date: 2021/10/18 21:30
    */
    private List<CategoryEntity> sortParentAndChild(List<CategoryEntity> entities, boolean treeMenu) {
        // 1,寻找集合中所有根节点  key为父节点id
        Map<Long, List<CategoryEntity>> pMap = new HashMap<>(1000);

        Set<Long> ids = new HashSet<>(1000);
        Set<Long> pids = new HashSet<>(500);
        for (CategoryEntity entity : entities) {
            ids.add(entity.getCatId());
            Long pid = entity.getParentCid();
            pids.add(pid);
            if (null == pMap.get(pid)) {
                pMap.put(pid, new ArrayList<CategoryEntity>());
            }
            pMap.get(pid).add(entity);
        }

        // 得到根节点，或者说形式上的根节点
        pids.removeAll(ids);

        if (ids.size() < entities.size()) {
            return null;
        }

        List<CategoryEntity> sortedList = new ArrayList<>();
        for (Long pid : pids) {
            List<CategoryEntity> queue = pMap.remove(pid);
            if (null != queue) {
                while (queue.size() > 0) {
                    CategoryEntity category = queue.remove(0);
                    List<CategoryEntity> childrenList = pMap.remove(category.getCatId());
                    category.setChildren(childrenList);
                    if (treeMenu && category.getParentCid() == pid) {
                        sortedList.add(category);
                    }
                    // 如果只得到一级菜单的队列，则下行语句可注释
                    if (null != childrenList) {
                        queue.addAll(childrenList);
                    }
                }

            }
        }
        return sortedList;
    }

    @Override
    public String deleteBatch(List<Long> ids) {
        int record = baseMapper.deleteBatchIds(ids);
        return "成功删除" + record + "条数据";
    }

    @Override
    public Long[] findCateLogPath(Long catelogId) {
        // 1.收集当前节点id
        List<Long> paths = new ArrayList<>();
        // 另一种方式
        // paths = findParentPath(catelogId, paths);
        // Collections.reverse(paths);

        String path = baseMapper.selectById(catelogId).getPath();
        // 忽略空值
        List<String> tempPathArray = Splitter.on("#").omitEmptyStrings().splitToList(path);
        Long[] pathAsArray = (Long [])ConvertUtils.convert(tempPathArray, Long[].class);
        return pathAsArray;
    }

    /***
    * @Description: 根据三级分类id，获取path
    * @Param: [catelogId, paths]
    * @return: java.util.List<java.lang.Long>
    * @Author: phil
    * @Date: 2021/11/8 11:18
    */
    private List<Long> findParentPath(Long catelogId, List<Long> paths) {
        paths.add(catelogId);
        CategoryEntity category = this.getById(catelogId);
        if (category.getParentCid() != 0) {
            findParentPath(category.getParentCid(),paths);
        }
        return paths;
    }

    @Override
    public void saveAllPath(){
        List<CategoryEntity> entities = baseMapper.selectList(null);

        Map<Long, Long> catIdAndParentMap = new HashMap<>(2000);
        Map<Integer, List<Long>> pMap = new HashMap<>(2000);
        Set<Long> ids = new HashSet<>(2000);
        Set<Integer> levels = new HashSet<>(2000);
        for (CategoryEntity entity : entities) {
            // 三级分类id,父级id关联关系
            catIdAndParentMap.put(entity.getCatId(),entity.getParentCid());
            // 层级和三级分类Id的关联关系
            ids.add(entity.getCatId());
            Integer catLevel = entity.getCatLevel();
            levels.add(catLevel);
            if (null == pMap.get(catLevel)) {
                pMap.put(catLevel,new ArrayList<>());
            }
            pMap.get(catLevel).add(entity.getCatId());
        }

        if (ids.size() != entities.size()) {
            throw new BizException("主键数据量与实体不一致！");
        }

        Map<Long, String> catIdPathMap = new HashMap<>(2000);

        for (Integer level : levels) {
            List<Long> queue = pMap.remove(level);

            if (null != queue) {
                while (queue.size() > 0) {
                    Long id = queue.remove(0);
                    String  path = StringUtils.isEmpty(catIdPathMap.get(catIdAndParentMap.get(id))) ? "#" + id.toString() : catIdPathMap.get(catIdAndParentMap.get(id)) + "#" + id.toString();
                    catIdPathMap.put(id, path);
                }
            }
        }

        baseMapper.updatePath(catIdPathMap);
    }

    @Override
    @Transactional(rollbackFor=Exception.class)
    public void updateCascade(CategoryEntity category) {
        if (null == category || StringUtils.isEmpty(category.getCatId())) {
            throw new BizException("传入参数不完整，无法进行后续操作!");
        }
        CategoryEntity dbCategory = baseMapper.selectById(category.getCatId());
        if (null == dbCategory) {
            throw new BizException("根据Id未找到分类信息，无法进行更新数据!");
        }
        // 父id是否发生变化，变化则需要更新路径
        if (dbCategory.getParentCid() != category.getParentCid()) {
            CategoryEntity parent = this.getById(category.getParentCid());
            if (null == parent) {
                throw new BizException("未查询到父级节点信息，操作失败！");
            }
            category.setPath(parent.getPath() + "#" + category.getCatId());
        }
        BeanUtils.copyWithoutNull(dbCategory,category,null);
        BeanUtils.updateAuditFields(dbCategory,false,"hudong");
        baseMapper.updateById(dbCategory);
        categoryBrandRelationService.updateCategory(dbCategory.getCatId(), dbCategory.getName());
    }

    @Override
    public Map<Long, String> getIdPathNameRelation() {
        return getIdPathNameRelation(null);
    }

    @Override
    public Map<Long, String> getIdPathNameRelation(Long catId) {

        List<CategoryEntity> categoryEntities = baseMapper.selectList(null);
        Map<Long, String> cateIdNameMap = new HashMap<>(500);
        Map<Long, String> cateIdPathNameMap = new HashMap<>(500);
        for (CategoryEntity categoryEntity : categoryEntities) {
            cateIdNameMap.put(categoryEntity.getCatId(), categoryEntity.getName());
        }
        for (CategoryEntity categoryEntity : categoryEntities) {
            // 根据catId查询，则过滤掉其他数据，否则查询全部
            if (null != catId && !categoryEntity.getCatId().equals(catId)) {
                break;
            }
            StringBuilder pathName = new StringBuilder();
            if (null != categoryEntity.getPath()) {
                List<String> pathIdList = Splitter.on("#").omitEmptyStrings().splitToList(categoryEntity.getPath());
                for (String pathStr : pathIdList) {
                    long pathId = Long.parseLong(pathStr);
                    if (StringUtils.isNotEmpty(cateIdNameMap.get(pathId))) {
                        if (pathName.length() > 0) {
                            pathName.append("/");
                        }
                        pathName.append(cateIdNameMap.get(pathId));
                    }
                }
                if (StringUtils.isNotEmpty(pathName.toString())) {
                    cateIdPathNameMap.put(categoryEntity.getCatId(), pathName.toString());
                }
            }
        }
        return cateIdPathNameMap;
    }



    @Override
    @Transactional(rollbackFor=Exception.class)
    public void saveCategory(CategoryEntity category) {
        BeanUtils.updateAuditFields(category,true,"hudong");
        baseMapper.insert(category);
        // 更新分类路径，更新失败，则新增分类失败

        if (null == category.getParentCid()) {
            throw new BizException("未获取到新增分类的父id!");
        }
        CategoryEntity parent = this.getById(category.getParentCid());
        if (null != parent && null != category.getCatId()) {
            category.setPath(parent.getPath() + '#' + category.getCatId());
        }
        if (null == category.getPath()) {
            throw new BizException("分类的路径为空,无法保存！");
        }
        // 将路径保存到新增分类中
        BeanUtils.updateAuditFields(category,false,"hudong");
        baseMapper.updateById(category);
    }

    @Override
    public List<CategoryEntity> getLevel1Category() {
        long start = System.currentTimeMillis();
        List<CategoryEntity> level1CategoryEntities = baseMapper.selectList(new LambdaQueryWrapper<CategoryEntity>().eq(CategoryEntity::getParentCid, PID_OF_LEVEL_1));
        long end = System.currentTimeMillis();
        System.out.println("getLevel1Category耗时：" + (end - start) );
        return level1CategoryEntities;
    }

    /**
    * @description: 通过redisson占坑来试下分布式锁
     * 缓存里面的数据如何和数据库保持一致
     * 缓存数据一致性
     * 1）、双写模式
     * 2）、失效模式
    * @param: []
    * @return: java.util.Map<java.lang.String,java.util.List<com.tech.gulimall.product.entity.vo.Catalog2Vo>>
    * @author: phil
    * @date: 2022/5/25 21:37
    */
    public Map<String, List<Catalog2Vo>> getCatalogJsonDbWithRedissonLock() {

        // 1. 锁的名字 -> 锁的粒度，越细越快
        // 锁的粒度，具体缓存的是某个数据，如11号商品： product-11-lock  product-12-lock
        RLock lock = redisson.getLock("CatalogJson-lock");
        lock.lock();
        Map<String, List<Catalog2Vo>> categoryDB;
        try {
            categoryDB = getCategoryDB();
        } finally {
            lock.unlock();
        }
        return categoryDB;
    }

    /**
    * @description: 通过redis占坑来试下分布式锁
     *  使用redis实现分布式锁  需要保证 加锁保证原子性， 解锁也要保证原子性
    * @param: []
    * @return: java.util.Map<java.lang.String,java.util.List<com.tech.gulimall.product.entity.vo.Catalog2Vo>>
    * @author: phil
    * @date: 2022/5/24 18:56
    */
    public Map<String, List<Catalog2Vo>> getCatalogJsonDbWithRedisLock() {
        String uuid = UUID.randomUUID().toString();
        ValueOperations<String, String> ops = redisTemplate.opsForValue();
        // redis中的 set NX 对应 setIfAbsent, 如果不存在才可以set，否则返回null
        // 一、设置锁和设置过期时间必须是一个原子操作
        // setIfAbsent 参数说明： （key, value, 过期时间， 时间单位） 下面代码是 设置过期时间为300秒
        Boolean lock = ops.setIfAbsent(LOCK, uuid, 300, TimeUnit.SECONDS);

        if (lock) {
            System.out.println("获取分布式锁成功。。。。");
            Map<String, List<Catalog2Vo>> categoryDB;
            try {
                categoryDB = getCategoryDB();
            } finally {
                String lockValue = ops.get(LOCK);
                // 二、 删除锁可能会出现的问题:
                // 1. 业务超时怎么办
                // 2. 如果由于业务时间很长，锁自己过期了，我们直接删除，有可能把别人正在持有的锁删除了。
                // 获取值对比 + 对比成功删锁 = 原子操作
                // 解决方案： 删除锁必须保证原子性。使用redis+Lua脚本完成
                // 获取值对比 + 对比成功删锁 = 原子操作
                // lun脚本地址 -> http://www.redis.cn/commands/set.html
                String script = "if redis.call(\"get\",KEYS[1]) == ARGV[1]\n" +
                        "then\n" +
                        "    return redis.call(\"del\",KEYS[1])\n" +
                        "else\n" +
                        "    return 0\n" +
                        "end";
                // 删除锁，使用script脚本
                redisTemplate.execute(new DefaultRedisScript<Long>(script, Long.class), Arrays.asList(LOCK), lockValue);

            }
           return categoryDB;
        } else {
            System.out.println("获取分布式锁失败。。。。");
            try {
                Thread.sleep(100);
            } catch (InterruptedException e) {
                log.error(e.getLocalizedMessage());
            }
            return getCatalogJsonDbWithRedisLock();
        }
    }

    // TODO 产生堆外内存溢出. OutOfDirectMemoryError
    //    1)、springboot2.0以后默认使用lettuce作为操作redis的客户端，它使用netty进行网络通信
    //    2)、lettuce的bug导致netty堆外内存溢出。netty如果没有指定堆外内存，默认使用Xms的值，可以使用-Dio.netty.maxDirectMemory进行设置
    //    解决方案：由于是lettuce的bug造成，不要直接使用-Dio.netty.maxDirectMemory去调大虚拟机堆外内存，治标不治本。
    //            1)、升级lettuce客户端。但是没有解决的
    //            2)、切换使用jedis
    //  Lettuce、redis操作redis的底层客户端。spring再次封装redisTemplate.

    @Override
    public Map<String, List<Catalog2Vo>> getCatalogJsonDBWithSpringCache() {
        // 给缓存中放入json字符串，拿出的json字符串，还用逆转为能用的对象类型。【序列化与反序列化】

        /**
         * 1. 空结果缓存：解决缓存穿透
         * 2. 设置过期时间（加随机值）： 解决缓存雪崩
         * 3. 加锁： 解决缓存击穿
         */

        // 1. 加入缓存逻辑，缓存中存的数据是json字符串
        ValueOperations<String, String> ops = redisTemplate.opsForValue();
        String catalogJson = ops.get("catalogJson");

        // 2. 缓存中没有，查询数据库
        if (null == catalogJson) {
            System.out.println("缓存不命中，查询数据库！！！");

            Map<String, List<Catalog2Vo>> categoryDB = getCategoryDBBySync();
            return categoryDB;
        }

        System.out.println("缓存命中！！！！");

        //转为指定对象
        Map<String, List<Catalog2Vo>> listMap = JSON.parseObject(catalogJson, new TypeReference<Map<String, List<Catalog2Vo>>>() {
        });

        return listMap;
    }

    /**
    * @description: 从数据库中获取三级分类数据（未进行并发处理）
    * @param: []
    * @return: java.util.Map<java.lang.String,java.util.List<com.tech.gulimall.product.entity.vo.Catalog2Vo>>
    * @author: phil
    * @date: 2022/5/24 19:31
    */
    private Map<String, List<Catalog2Vo>> getCategoryDB() {
        Map<String, List<Catalog2Vo>> listMap = new HashMap<>();
        List<CategoryEntity> categoryEntities = queryListTreeByFor();

        String catalogJson = redisTemplate.opsForValue().get("catalogJson");
        if (StringUtils.isNotEmpty(catalogJson)) {
            listMap = JSON.parseObject(catalogJson, new TypeReference<Map<String, List<Catalog2Vo>>>() {
            });
        } else {
            System.out.println("查询了数据库！！！！" + Thread.currentThread().getId());
            // 一级分类
            for (CategoryEntity level1 : categoryEntities) {
                List<Catalog2Vo> catalog2Vos = new ArrayList<>(32);
                // 二级分类
                for (CategoryEntity level2 : level1.getChildren()) {
                    Catalog2Vo catalog2Vo = new Catalog2Vo();
                    catalog2Vo.setCatalog1Id(level2.getParentCid().toString());
                    catalog2Vo.setId(level2.getCatId().toString());
                    catalog2Vo.setName(level2.getName());

                    // 三级分类
                    List<Catalog2Vo.Catalog3List> catalog3Vos = level2.getChildren().stream().map(level3 ->
                                    new Catalog2Vo.Catalog3List(level3.getParentCid().toString(), level3.getCatId().toString(), level3.getName()))
                            .collect(Collectors.toList());

                    catalog2Vo.setCatalog3List(catalog3Vos);
                    catalog2Vos.add(catalog2Vo);
                }

                listMap.put(level1.getCatId().toString(), catalog2Vos);
            }
            // 3. 将查到的数据对象转为json放入缓存中
            String catalogDBJson = JSON.toJSONString(listMap);
            redisTemplate.opsForValue().set("catalogJson", catalogDBJson);
        }
        // 执行查询数据库


        // 查看数据及所占空间大小
//        System.out.println("listMap: " + JSON.toJSONString(listMap));

        byte[] strByUtf8 = StringUtils.strConvertBytes(JSON.toJSONString(listMap), "utf-8");
        System.out.println("utf-8编码下所占的空间:" + StringUtils.setSize(strByUtf8.length));

        byte[] strByGbk = StringUtils.strConvertBytes(JSON.toJSONString(listMap), "gbk");
        System.out.println("gbk编码下所占的空间:" + StringUtils.setSize(strByGbk.length));

        return listMap;
    }

    /**
    * @description: 使用本地锁从数据库中查出三级分类
    * @param: []
    * @return: java.util.Map<java.lang.String,java.util.List<com.tech.gulimall.product.entity.vo.Catalog2Vo>>
    * @author: phil
    * @date: 2022/5/17 16:35
    */
    private Map<String, List<Catalog2Vo>> getCategoryDBBySync() {
        Map<String, List<Catalog2Vo>> listMap = new HashMap<>();
        List<CategoryEntity> categoryEntities = queryListTreeByFor();

        // 单体架构：使用本地锁。synchronized,JUC(Lock)      分布式：使用分布式锁
        // 下面使用的本地锁。只要是同一把锁，就能锁住需要这个锁的所有线程
        // synchronized (this): this代表当前实例，springboot所有对象都是单例的。
        synchronized (this) {
            // 得到锁以后，我们应该再去缓存中确定一次，如果没有才需要继续查询
            String catalogJson = redisTemplate.opsForValue().get("catalogJson");
            if (StringUtils.isNotEmpty(catalogJson)) {
                listMap = JSON.parseObject(catalogJson, new TypeReference<Map<String, List<Catalog2Vo>>>() {
                });
            } else {
                System.out.println("查询了数据库！！！！" + Thread.currentThread().getId());
                // 一级分类
                for (CategoryEntity level1 : categoryEntities) {
                    List<Catalog2Vo> catalog2Vos = new ArrayList<>(32);
                    // 二级分类
                    for (CategoryEntity level2 : level1.getChildren()) {
                        Catalog2Vo catalog2Vo = new Catalog2Vo();
                        catalog2Vo.setCatalog1Id(level2.getParentCid().toString());
                        catalog2Vo.setId(level2.getCatId().toString());
                        catalog2Vo.setName(level2.getName());

                        // 三级分类
                        List<Catalog2Vo.Catalog3List> catalog3Vos = level2.getChildren().stream().map(level3 ->
                                        new Catalog2Vo.Catalog3List(level3.getParentCid().toString(), level3.getCatId().toString(), level3.getName()))
                                .collect(Collectors.toList());

                        catalog2Vo.setCatalog3List(catalog3Vos);
                        catalog2Vos.add(catalog2Vo);
                    }

                    listMap.put(level1.getCatId().toString(), catalog2Vos);
                }
                // 3. 将查到的数据对象转为json放入缓存中
                String catalogDBJson = JSON.toJSONString(listMap);
                redisTemplate.opsForValue().set("catalogJson", catalogDBJson);
            }
            // 执行查询数据库
        }


        // 查看数据及所占空间大小
//        System.out.println("listMap: " + JSON.toJSONString(listMap));

        byte[] strByUtf8 = StringUtils.strConvertBytes(JSON.toJSONString(listMap), "utf-8");
        System.out.println("utf-8编码下所占的空间:" + StringUtils.setSize(strByUtf8.length));

        byte[] strByGbk = StringUtils.strConvertBytes(JSON.toJSONString(listMap), "gbk");
        System.out.println("gbk编码下所占的空间:" + StringUtils.setSize(strByGbk.length));

        return listMap;
    }

}