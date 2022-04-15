package com.tech.gulimall.ware.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tech.gulimall.common.constant.enums.PurchaseStatusEnum;
import com.tech.gulimall.common.exception.BizException;
import com.tech.gulimall.common.utils.BeanUtils;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.common.utils.Query;
import com.tech.gulimall.common.utils.StringUtils;
import com.tech.gulimall.ware.dao.PurchaseDao;
import com.tech.gulimall.ware.entity.PurchaseDetailEntity;
import com.tech.gulimall.ware.entity.PurchaseEntity;
import com.tech.gulimall.ware.service.PurchaseDetailService;
import com.tech.gulimall.ware.service.PurchaseService;
import com.tech.gulimall.ware.vo.MergeVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static java.util.Arrays.asList;

@Service("purchaseService")
@Slf4j
public class PurchaseServiceImpl extends ServiceImpl<PurchaseDao, PurchaseEntity> implements PurchaseService {

    @Autowired
    private PurchaseDetailService purchaseDetailService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<PurchaseEntity> page = this.page(
                new Query<PurchaseEntity>().getPage(params),
                new QueryWrapper<PurchaseEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public PageUtils queryPageUnReceivePurchase(Map<String, Object> params) {

        LambdaQueryWrapper<PurchaseEntity> queryWrapper = new LambdaQueryWrapper<>();

        // 0-新建 1-已分配
        List<Integer> status = asList(0, 1);
        queryWrapper.in(PurchaseEntity::getStatus ,status);

        IPage<PurchaseEntity> page = this.page(
                new Query<PurchaseEntity>().getPage(params),
                queryWrapper
        );

        return new PageUtils(page);
    }

    @Override
    @Transactional(rollbackFor = BizException.class)
    public String mergePurchase(MergeVo mergeVo) {
        StringBuilder msg = new StringBuilder();
        List<Long> errorItems = new ArrayList<>();
        Long purchaseId = mergeVo.getPurchaseId();
        //没有选择任何【采购单】，将自动创建新单进行合并。
        if (null == purchaseId) {
            PurchaseEntity purchaseEntity = new PurchaseEntity();
            //设置采购单的默认状态
            purchaseEntity.setPriority(1);
            purchaseEntity.setStatus(PurchaseStatusEnum.CREATED.getCode());
            purchaseEntity.setAmount(new BigDecimal(0));
            BeanUtils.updateAuditFields(purchaseEntity,true);
            this.save(purchaseEntity);

            //获取新建采购单的id
            purchaseId = purchaseEntity.getId();
        }

        List<Long> items = mergeVo.getItems();


        Collection<PurchaseDetailEntity> dbPurchaseDetailEntities = purchaseDetailService.listByIds(items);
        Long finalPurchaseId = purchaseId;

        List<PurchaseDetailEntity> collect = dbPurchaseDetailEntities.stream().filter(purchaseDetailEntity -> {
            // 确认采购状态 0,1才可以合并，否则不能合并
            if (StringUtils.isNotEmpty(purchaseDetailEntity.getStatus()) &&
                    ! purchaseDetailEntity.getStatus().equals(PurchaseStatusEnum.CREATED.getCode()) &&
                    ! purchaseDetailEntity.getStatus().equals(PurchaseStatusEnum.ASSIGNED.getCode())) {
                errorItems.add(purchaseDetailEntity.getId());
                return false;
            }
            return true;
        }).map(purchaseDetailEntity -> {
            purchaseDetailEntity.setPurchaseId(finalPurchaseId);
            purchaseDetailEntity.setStatus(PurchaseStatusEnum.ASSIGNED.getCode());
            BeanUtils.updateAuditFields(purchaseDetailEntity, false);
            return purchaseDetailEntity;
        }).collect(Collectors.toList());
        // 批量修改
        purchaseDetailService.updateBatchById(collect);

        // 更新下 采购单修改时间
        PurchaseEntity purchaseEntity = new PurchaseEntity();
        purchaseEntity.setId(purchaseId);
        BeanUtils.updateAuditFields(purchaseEntity, false);
        this.updateById(purchaseEntity);

        String successMsg = "成功合并" + (items.size() - errorItems.size()) + "个采购单.";

        msg.append(successMsg);
        log.info(successMsg);

        if (errorItems.size() != 0) {
            String errorMsg = "id为" + errorItems + "未能成功,因为采购单状态不是新建或已分配状态。";
            log.error(errorMsg);
            msg.append(errorMsg);
        }

        return msg.toString();
    }

}