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
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
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

        // ????????????????????????
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
    * @Description: ????????????????????????
    * @Param: [entities, treeMenu] treeMenu ??????????????????????????????
    * @return: java.util.List<com.tech.gulimall.product.entity.CategoryEntity> 
    * @Author: phil 
    * @Date: 2021/10/18 21:30
    */
    private List<CategoryEntity> sortParentAndChild(List<CategoryEntity> entities, boolean treeMenu) {
        // 1,??????????????????????????????  key????????????id
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

        // ????????????????????????????????????????????????
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
                    // ???????????????????????????????????????????????????????????????
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
        return "????????????" + record + "?????????";
    }

    @Override
    public Long[] findCateLogPath(Long catelogId) {
        // 1.??????????????????id
        List<Long> paths = new ArrayList<>();
        // ???????????????
        // paths = findParentPath(catelogId, paths);
        // Collections.reverse(paths);

        String path = baseMapper.selectById(catelogId).getPath();
        // ????????????
        List<String> tempPathArray = Splitter.on("#").omitEmptyStrings().splitToList(path);
        Long[] pathAsArray = (Long [])ConvertUtils.convert(tempPathArray, Long[].class);
        return pathAsArray;
    }

    /***
    * @Description: ??????????????????id?????????path
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
            // ????????????id,??????id????????????
            catIdAndParentMap.put(entity.getCatId(),entity.getParentCid());
            // ?????????????????????Id???????????????
            ids.add(entity.getCatId());
            Integer catLevel = entity.getCatLevel();
            levels.add(catLevel);
            if (null == pMap.get(catLevel)) {
                pMap.put(catLevel,new ArrayList<>());
            }
            pMap.get(catLevel).add(entity.getCatId());
        }

        if (ids.size() != entities.size()) {
            throw new BizException("????????????????????????????????????");
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

    // @CacheEvict ???????????????????????????
    // @CacheEvict(value = {"category"}, key = "'getLevel1Category'")

    // ?????????????????????????????????????????????????????????redis???????????????????????? ??? ??????????????????
    // 1???@Caching ??????????????????????????????
//    @Caching(evict = {
//            @CacheEvict(value = {"category"}, key = "'getLevel1Category'"),
//            @CacheEvict(value = {"category"}, key = "'getCatalogJsonDBWithSpringCache'")
//    })

    // 2?????????@CacheEvict??????????????????????????????????????? allEntries ??????category????????????????????????????????????false
    @CacheEvict(value = {"category"}, allEntries = true)
    @Override
    @Transactional(rollbackFor=Exception.class)
    public void updateCascade(CategoryEntity category) {
        if (null == category || StringUtils.isEmpty(category.getCatId())) {
            throw new BizException("????????????????????????????????????????????????!");
        }
        CategoryEntity dbCategory = baseMapper.selectById(category.getCatId());
        if (null == dbCategory) {
            throw new BizException("??????Id????????????????????????????????????????????????!");
        }
        // ???id????????????????????????????????????????????????
        if (dbCategory.getParentCid() != category.getParentCid()) {
            CategoryEntity parent = this.getById(category.getParentCid());
            if (null == parent) {
                throw new BizException("????????????????????????????????????????????????");
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
            // ??????catId??????????????????????????????????????????????????????
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
        // ?????????????????????????????????????????????????????????

        if (null == category.getParentCid()) {
            throw new BizException("??????????????????????????????id!");
        }
        CategoryEntity parent = this.getById(category.getParentCid());
        if (null != parent && null != category.getCatId()) {
            category.setPath(parent.getPath() + '#' + category.getCatId());
        }
        if (null == category.getPath()) {
            throw new BizException("?????????????????????,???????????????");
        }
        // ?????????????????????????????????
        BeanUtils.updateAuditFields(category,false,"hudong");
        baseMapper.updateById(category);
    }

    /**
     *  ??????????????? https://docs.spring.io/spring-framework/docs/current/reference/html/integration.html#cache
     *
     *      @Cacheable({"category"})
     *      1. ?????????????????????????????????????????????????????????????????????????????????; ??????????????????????????????????????????????????????????????????????????????
     *      2. ?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
     *      3. ????????????
     *           1????????????????????????????????????????????????
     *           2??????key???????????????????????????????????? ::SimpleKey []{???????????????key???}
     *           3??????????????????value??????????????????jdk????????????????????????????????????????????????redis
     *           4) ?????????ttl?????????-1
 *           ????????????
     *           1?????????????????????????????????key        key???????????????????????????SpEL????????????SpEL??????????????????????????????????????????????????? ???key = "'level1Categorys'"    https://docs.spring.io/spring-framework/docs/current/reference/html/integration.html#cache-spel-context
     *              @Cacheable(value = {"category"}, key = "'level1Categorys'") ???   @Cacheable(value = {"category"}, key = "#root.method.name") #root.method.name ???????????????
     *           2?????????????????????????????????????????????ttl???   ?????????????????????ttl
     *           3????????????????????????json??????
     *
     *       Spring-Cache????????????
     *  *          1??????????????????
     *  *              ???????????????????????????null?????????
     *  *                  ???????????????????????? ????????????????????? --> spring.cache.redis.cache-null-values=true
     *  *              ????????????????????????????????????????????????????????????????????????
     *  *                  ???????????????(?????????????????????)      sync = true ????????????????????????    ???     @Cacheable(value = {"category"}, key = "#root.method.name", sync = true)
     *  *              ????????????????????????key??????????????????????????????????????????????????????????????????????????????????????????10+w???key???????????????????????????10w+????????????????????????????????????
     *  *                  ????????????????????????????????????????????? spring.cache.redis.time-to-live=3600000
     *  *          2????????????????????????????????????????????????
     *  *              1?????????????????????    ??????????????????????????????
     *  *              2?????????????????????Canal,?????????mysql???????????????????????????
     *  *              3???????????????????????????????????????????????????
     *  *
     *  *     ?????????  CacheManager???RedisCacheManager??? --> Cache???RedisCache???  --> Cache?????????????????????
     * @return
     */
    @Cacheable(value = {"category"}, key = "#root.method.name", sync = true)
    @Override
    public List<CategoryEntity> getLevel1Category() {
        long start = System.currentTimeMillis();
        List<CategoryEntity> level1CategoryEntities = baseMapper.selectList(new LambdaQueryWrapper<CategoryEntity>().eq(CategoryEntity::getParentCid, PID_OF_LEVEL_1));
        long end = System.currentTimeMillis();
        System.out.println("getLevel1Category?????????" + (end - start) );
        return level1CategoryEntities;
    }




    /**
    * @description: ??????redisson???????????????????????????
     * ???????????????????????????????????????????????????
     * ?????????????????????
     * 1??????????????????
     * 2??????????????????
    * @param: []
    * @return: java.util.Map<java.lang.String,java.util.List<com.tech.gulimall.product.entity.vo.Catalog2Vo>>
    * @author: phil
    * @date: 2022/5/25 21:37
    */
    public Map<String, List<Catalog2Vo>> getCatalogJsonDbWithRedissonLock() {

        // 1. ???????????? -> ???????????????????????????
        // ???????????????????????????????????????????????????11???????????? product-11-lock  product-12-lock
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
    * @description: ??????redis???????????????????????????
     *  ??????redis??????????????????  ???????????? ???????????????????????? ???????????????????????????
    * @param: []
    * @return: java.util.Map<java.lang.String,java.util.List<com.tech.gulimall.product.entity.vo.Catalog2Vo>>
    * @author: phil
    * @date: 2022/5/24 18:56
    */
    public Map<String, List<Catalog2Vo>> getCatalogJsonDbWithRedisLock() {
        String uuid = UUID.randomUUID().toString();
        ValueOperations<String, String> ops = redisTemplate.opsForValue();
        // redis?????? set NX ?????? setIfAbsent, ????????????????????????set???????????????null
        // ???????????????????????????????????????????????????????????????
        // setIfAbsent ??????????????? ???key, value, ??????????????? ??????????????? ??????????????? ?????????????????????300???
        Boolean lock = ops.setIfAbsent(LOCK, uuid, 300, TimeUnit.SECONDS);

        if (lock) {
            System.out.println("????????????????????????????????????");
            Map<String, List<Catalog2Vo>> categoryDB;
            try {
                categoryDB = getCategoryDB();
            } finally {
                String lockValue = ops.get(LOCK);
                // ?????? ?????????????????????????????????:
                // 1. ?????????????????????
                // 2. ???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
                // ??????????????? + ?????????????????? = ????????????
                // ??????????????? ???????????????????????????????????????redis+Lua????????????
                // ??????????????? + ?????????????????? = ????????????
                // lun???????????? -> http://www.redis.cn/commands/set.html
                String script = "if redis.call(\"get\",KEYS[1]) == ARGV[1]\n" +
                        "then\n" +
                        "    return redis.call(\"del\",KEYS[1])\n" +
                        "else\n" +
                        "    return 0\n" +
                        "end";
                // ??????????????????script??????
                redisTemplate.execute(new DefaultRedisScript<Long>(script, Long.class), Arrays.asList(LOCK), lockValue);

            }
           return categoryDB;
        } else {
            System.out.println("????????????????????????????????????");
            try {
                Thread.sleep(100);
            } catch (InterruptedException e) {
                log.error(e.getLocalizedMessage());
            }
            return getCatalogJsonDbWithRedisLock();
        }
    }

    @Cacheable(value = {"category"}, key = "#root.methodName")
    @Override
    public Map<String, List<Catalog2Vo>> getCatalogJsonDBWithSpringCache() {
        Map<String, List<Catalog2Vo>> listMap = new HashMap<>();
        List<CategoryEntity> categoryEntities = queryListTreeByFor();

        String catalogJson = redisTemplate.opsForValue().get("catalogJson");
        if (StringUtils.isNotEmpty(catalogJson)) {
            listMap = JSON.parseObject(catalogJson, new TypeReference<Map<String, List<Catalog2Vo>>>() {
            });
        } else {
            System.out.println("??????????????????????????????" + Thread.currentThread().getId());
            // ????????????
            for (CategoryEntity level1 : categoryEntities) {
                List<Catalog2Vo> catalog2Vos = new ArrayList<>(32);
                // ????????????
                for (CategoryEntity level2 : level1.getChildren()) {
                    Catalog2Vo catalog2Vo = new Catalog2Vo();
                    catalog2Vo.setCatalog1Id(level2.getParentCid().toString());
                    catalog2Vo.setId(level2.getCatId().toString());
                    catalog2Vo.setName(level2.getName());

                    // ????????????
                    List<Catalog2Vo.Catalog3List> catalog3Vos = level2.getChildren().stream().map(level3 ->
                                    new Catalog2Vo.Catalog3List(level3.getParentCid().toString(), level3.getCatId().toString(), level3.getName()))
                            .collect(Collectors.toList());

                    catalog2Vo.setCatalog3List(catalog3Vos);
                    catalog2Vos.add(catalog2Vo);
                }

                listMap.put(level1.getCatId().toString(), catalog2Vos);
            }
        }

        return listMap;

    }

    // TODO ????????????????????????. OutOfDirectMemoryError
    //    1)???springboot2.0??????????????????lettuce????????????redis????????????????????????netty??????????????????
    //    2)???lettuce???bug??????netty?????????????????????netty?????????????????????????????????????????????Xms?????????????????????-Dio.netty.maxDirectMemory????????????
    //    ????????????????????????lettuce???bug???????????????????????????-Dio.netty.maxDirectMemory???????????????????????????????????????????????????
    //            1)?????????lettuce?????????????????????????????????
    //            2)???????????????jedis
    //  Lettuce???redis??????redis?????????????????????spring????????????redisTemplate.

    @Override
    public Map<String, List<Catalog2Vo>> getCatalogJsonDBWithRedis() {
        // ??????????????????json?????????????????????json?????????????????????????????????????????????????????????????????????????????????

        /**
         * 1. ????????????????????????????????????
         * 2. ??????????????????????????????????????? ??????????????????
         * 3. ????????? ??????????????????
         */

        // 1. ?????????????????????????????????????????????json?????????
        ValueOperations<String, String> ops = redisTemplate.opsForValue();
        String catalogJson = ops.get("catalogJson");

        // 2. ?????????????????????????????????
        if (null == catalogJson) {
            System.out.println("??????????????????????????????????????????");

            Map<String, List<Catalog2Vo>> categoryDB = getCategoryDBBySync();
            return categoryDB;
        }

        System.out.println("????????????????????????");

        //??????????????????
        Map<String, List<Catalog2Vo>> listMap = JSON.parseObject(catalogJson, new TypeReference<Map<String, List<Catalog2Vo>>>() {
        });

        return listMap;
    }

    /**
    * @description: ??????????????????????????????????????????????????????????????????
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
            System.out.println("??????????????????????????????" + Thread.currentThread().getId());
            // ????????????
            for (CategoryEntity level1 : categoryEntities) {
                List<Catalog2Vo> catalog2Vos = new ArrayList<>(32);
                // ????????????
                for (CategoryEntity level2 : level1.getChildren()) {
                    Catalog2Vo catalog2Vo = new Catalog2Vo();
                    catalog2Vo.setCatalog1Id(level2.getParentCid().toString());
                    catalog2Vo.setId(level2.getCatId().toString());
                    catalog2Vo.setName(level2.getName());

                    // ????????????
                    List<Catalog2Vo.Catalog3List> catalog3Vos = level2.getChildren().stream().map(level3 ->
                                    new Catalog2Vo.Catalog3List(level3.getParentCid().toString(), level3.getCatId().toString(), level3.getName()))
                            .collect(Collectors.toList());

                    catalog2Vo.setCatalog3List(catalog3Vos);
                    catalog2Vos.add(catalog2Vo);
                }

                listMap.put(level1.getCatId().toString(), catalog2Vos);
            }
            // 3. ??????????????????????????????json???????????????
            String catalogDBJson = JSON.toJSONString(listMap);
            redisTemplate.opsForValue().set("catalogJson", catalogDBJson);
        }
        // ?????????????????????


        // ?????????????????????????????????
//        System.out.println("listMap: " + JSON.toJSONString(listMap));

        byte[] strByUtf8 = StringUtils.strConvertBytes(JSON.toJSONString(listMap), "utf-8");
        System.out.println("utf-8????????????????????????:" + StringUtils.setSize(strByUtf8.length));

        byte[] strByGbk = StringUtils.strConvertBytes(JSON.toJSONString(listMap), "gbk");
        System.out.println("gbk????????????????????????:" + StringUtils.setSize(strByGbk.length));

        return listMap;
    }

    /**
    * @description: ????????????????????????????????????????????????
    * @param: []
    * @return: java.util.Map<java.lang.String,java.util.List<com.tech.gulimall.product.entity.vo.Catalog2Vo>>
    * @author: phil
    * @date: 2022/5/17 16:35
    */
    private Map<String, List<Catalog2Vo>> getCategoryDBBySync() {
        Map<String, List<Catalog2Vo>> listMap = new HashMap<>();
        List<CategoryEntity> categoryEntities = queryListTreeByFor();

        // ?????????????????????????????????synchronized,JUC(Lock)      ??????????????????????????????
        // ?????????????????????????????????????????????????????????????????????????????????????????????
        // synchronized (this): this?????????????????????springboot??????????????????????????????
        synchronized (this) {
            // ?????????????????????????????????????????????????????????????????????????????????????????????
            String catalogJson = redisTemplate.opsForValue().get("catalogJson");
            if (StringUtils.isNotEmpty(catalogJson)) {
                listMap = JSON.parseObject(catalogJson, new TypeReference<Map<String, List<Catalog2Vo>>>() {
                });
            } else {
                System.out.println("??????????????????????????????" + Thread.currentThread().getId());
                // ????????????
                for (CategoryEntity level1 : categoryEntities) {
                    List<Catalog2Vo> catalog2Vos = new ArrayList<>(32);
                    // ????????????
                    for (CategoryEntity level2 : level1.getChildren()) {
                        Catalog2Vo catalog2Vo = new Catalog2Vo();
                        catalog2Vo.setCatalog1Id(level2.getParentCid().toString());
                        catalog2Vo.setId(level2.getCatId().toString());
                        catalog2Vo.setName(level2.getName());

                        // ????????????
                        List<Catalog2Vo.Catalog3List> catalog3Vos = level2.getChildren().stream().map(level3 ->
                                        new Catalog2Vo.Catalog3List(level3.getParentCid().toString(), level3.getCatId().toString(), level3.getName()))
                                .collect(Collectors.toList());

                        catalog2Vo.setCatalog3List(catalog3Vos);
                        catalog2Vos.add(catalog2Vo);
                    }

                    listMap.put(level1.getCatId().toString(), catalog2Vos);
                }
                // 3. ??????????????????????????????json???????????????
                String catalogDBJson = JSON.toJSONString(listMap);
                redisTemplate.opsForValue().set("catalogJson", catalogDBJson);
            }
            // ?????????????????????
        }


        // ?????????????????????????????????
//        System.out.println("listMap: " + JSON.toJSONString(listMap));

        byte[] strByUtf8 = StringUtils.strConvertBytes(JSON.toJSONString(listMap), "utf-8");
        System.out.println("utf-8????????????????????????:" + StringUtils.setSize(strByUtf8.length));

        byte[] strByGbk = StringUtils.strConvertBytes(JSON.toJSONString(listMap), "gbk");
        System.out.println("gbk????????????????????????:" + StringUtils.setSize(strByGbk.length));

        return listMap;
    }

}