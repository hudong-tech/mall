package com.tech.gulimall.product.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tech.gulimall.common.exception.BizException;
import com.tech.gulimall.common.utils.BeanUtils;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.common.utils.Query;
import com.tech.gulimall.product.dao.SpuImagesDao;
import com.tech.gulimall.product.entity.po.SpuImagesEntity;
import com.tech.gulimall.product.service.SpuImagesService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@Service("spuImagesService")
public class SpuImagesServiceImpl extends ServiceImpl<SpuImagesDao, SpuImagesEntity> implements SpuImagesService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<SpuImagesEntity> page = this.page(
                new Query<SpuImagesEntity>().getPage(params),
                new QueryWrapper<SpuImagesEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    @Transactional
    public void saveImages(Long spuId, List<String> images) {
        if (null == spuId) {
            throw new BizException("传入参数不完整，无法保存spu图片集！");
        }
        if (null != images && images.size() >= 0) {
            ArrayList<SpuImagesEntity> imagesEntities = new ArrayList<>();
            for (String image : images) {
                SpuImagesEntity imagesEntity = new SpuImagesEntity();
                imagesEntity.setSpuId(spuId);
                imagesEntity.setImgUrl(image);
                BeanUtils.updateAuditFields(imagesEntity,true);
                imagesEntities.add(imagesEntity);
            }
            this.saveBatch(imagesEntities);
        }
    }

}