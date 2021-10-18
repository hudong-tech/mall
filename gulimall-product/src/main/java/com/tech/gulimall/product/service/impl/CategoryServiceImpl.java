package com.tech.gulimall.product.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.common.utils.Query;
import com.tech.gulimall.product.dao.CategoryDao;
import com.tech.gulimall.product.entity.CategoryEntity;
import com.tech.gulimall.product.service.CategoryService;
import org.springframework.stereotype.Service;

import java.util.*;

@Service("categoryService")
public class CategoryServiceImpl extends ServiceImpl<CategoryDao, CategoryEntity> implements CategoryService {

    private final static Integer ROOT_LEVEL = 1;

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
}