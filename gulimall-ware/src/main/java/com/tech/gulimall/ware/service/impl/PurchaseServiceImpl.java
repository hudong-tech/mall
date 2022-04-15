package com.tech.gulimall.ware.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tech.gulimall.common.constant.enums.PurchaseDetailStatusEnum;
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
import com.tech.gulimall.ware.vo.ReceivedPurchaseVo;
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

        String successMsg = "共提交" + items.size() + "个采购项，成功合并" + (items.size() - errorItems.size()) + "个采购单.";

        msg.append(successMsg);
        log.info(successMsg);

        if (errorItems.size() != 0) {
            String errorMsg = "id为" + errorItems + "未能成功,因为采购单状态不是新建或已分配状态。";
            log.info(errorMsg);
            msg.append(errorMsg);
        }

        return msg.toString();
    }

    @Override
    @Transactional
    public String receivedPurchase(ReceivedPurchaseVo receivedPurchaseVo) {
        StringBuilder msg = new StringBuilder();
        List<Long> errorItems = new ArrayList<>();
        int totalPurchaseNum = receivedPurchaseVo.getIds().size();
        if (null == receivedPurchaseVo) {
            throw new BizException("请求参数为空，无法进行下一步操作！");
        }
        if (null == receivedPurchaseVo.getIds()|| receivedPurchaseVo.getIds().size() ==0) {
            throw new BizException("领取采购单不能为空！");
        }
        if (StringUtils.isEmpty(receivedPurchaseVo.getUser())) {
            throw new BizException("无法获取当前采购人名！");
        }
        List<Long> purchaseList = new ArrayList<>();
        List<PurchaseEntity> dbPurchaseEntities = (List<PurchaseEntity>) this.listByIds(receivedPurchaseVo.getIds());

        dbPurchaseEntities = dbPurchaseEntities.stream().filter(item -> {
            //1、确认当前采购单是新建或者是已分配状态，且只能领取自己的采购单
            if (!(StringUtils.isNotEmpty(item.getAssigneeName()) &&
                    item.getAssigneeName().equals(receivedPurchaseVo.getUser()) &&
                    StringUtils.isNotEmpty(item.getStatus()) &&
                    item.getStatus().equals(PurchaseStatusEnum.CREATED.getCode()) ||
                    item.getStatus().equals(PurchaseStatusEnum.ASSIGNED.getCode()))) {
                errorItems.add(item.getId());
                return false;
            }
            return true;
        }).map(item -> {
            // 将采购单id加入集合，用于查询采购项
            purchaseList.add(item.getId());
            //2、改变采购单的状态
            item.setStatus(PurchaseStatusEnum.RECEIVE.getCode());
            BeanUtils.updateAuditFields(item, false);
            return item;
        }).collect(Collectors.toList());

        if (null != dbPurchaseEntities && dbPurchaseEntities.size() != 0) {
            this.updateBatchById(dbPurchaseEntities);
            //3、改变采购项的状态
            List<PurchaseDetailEntity> purchaseDetailEntities = purchaseDetailService.listDetailByPurchaseIds(purchaseList);



            if (null != purchaseDetailEntities && purchaseDetailEntities.size() > 0) {
                for (PurchaseDetailEntity purchaseDetailEntity : purchaseDetailEntities) {
                    purchaseDetailEntity.setStatus(PurchaseDetailStatusEnum.BUYING.getCode());
                    BeanUtils.updateAuditFields(purchaseDetailEntity,false);
                }
                purchaseDetailService.updateBatchById(purchaseDetailEntities);
            }

        }

        String successMsg = "共申领"+ totalPurchaseNum + "个采购单。" + "成功领取" + dbPurchaseEntities.size() + "个采购单.\n";
        log.info(successMsg);
        msg.append(successMsg);


        if (null != errorItems && errorItems.size() > 0) {
            String errorMsg = "id为" + errorItems + "未能成功,采购单应是新建或者是已分配状态，且只能领取自己的采购单。\n";
            log.info(errorMsg);
            msg.append(errorMsg);
        }
        return msg.toString();
    }

}