package com.tech.gulimall.product.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.google.common.base.Splitter;
import com.tech.gulimall.common.exception.BizException;
import com.tech.gulimall.common.utils.BeanUtils;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.common.utils.Query;
import com.tech.gulimall.product.dao.CategoryDao;
import com.tech.gulimall.product.entity.CategoryEntity;
import com.tech.gulimall.product.service.CategoryBrandRelationService;
import com.tech.gulimall.product.service.CategoryService;
import org.apache.commons.beanutils.ConvertUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.*;

@Service("categoryService")
public class CategoryServiceImpl extends ServiceImpl<CategoryDao, CategoryEntity> implements CategoryService {

    private final static Integer ROOT_LEVEL = 1;

    @Autowired
    private CategoryBrandRelationService categoryBrandRelationService;

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
        return sortParentAndChild(dbCategoryList);
    }

    /** 
    * @Description: 很好的菜单树算法
    * @Param: [entities] 
    * @return: java.util.List<com.tech.gulimall.product.entity.CategoryEntity> 
    * @Author: phil 
    * @Date: 2021/10/18 21:30
    */
    private List<CategoryEntity> sortParentAndChild(List<CategoryEntity> entities) {
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
                    sortedList.add(category);
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
    public void updateCascade(CategoryEntity category) {
        if (null == category || StringUtils.isEmpty(category.getCatId())) {
            throw new BizException("传入参数不完整，无法进行后续操作!");
        }
        CategoryEntity dbCategory = baseMapper.selectById(category.getCatId());
        if (null == dbCategory) {
            throw new BizException("根据Id未找到分类信息，无法进行更新数据!");
        }

        BeanUtils.copyWithoutNull(dbCategory,category,null);
        BeanUtils.updateAuditFields(dbCategory,false,"hudong");
        baseMapper.updateById(dbCategory);
        categoryBrandRelationService.updateCategory(dbCategory.getCatId(), dbCategory.getName());
    }
}