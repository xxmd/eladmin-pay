package me.zhengjie.modules.pay.service;

import me.zhengjie.modules.pay.entity.PayMerchant;
import me.zhengjie.modules.pay.entity.query.PayMerchantQueryCriteria;
import me.zhengjie.modules.pay.repository.PayMerchantRepository;
import me.zhengjie.modules.pay.service.dto.PayMerchantDto;
import me.zhengjie.modules.pay.service.mapstruct.PayMerchantMapper;
import me.zhengjie.utils.PageResult;
import me.zhengjie.utils.PageUtil;
import me.zhengjie.utils.QueryHelp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.Set;

@Service
@Transactional
public class PayMerchantService {
    @Autowired
    private PayMerchantRepository repository;
    @Autowired
    private PayMerchantMapper mapper;

    public void create(@Validated @RequestBody PayMerchant entity) {
        repository.save(entity);
    }


    public void delete(Set<Long> idSet) {
        repository.deleteAllById(idSet);
    }

    public void update(@Validated @RequestBody PayMerchant entity) {
        repository.save(entity);
    }

    //    public PageResult<PayMerchantDto> read(PayMerchantQueryCriteria criteria, Pageable pageable) {
//        Page<PayMerchant> page = repository.findAll((root, criteriaQuery, criteriaBuilder) -> QueryHelp.getPredicate(root, criteria, criteriaBuilder), pageable);
//        return PageUtil.toPage(page.map(mapper::toDto));
//    }
    public Page<PayMerchant> read(PayMerchantQueryCriteria criteria, Pageable pageable) {
        return repository.findAll((root, criteriaQuery, criteriaBuilder) -> QueryHelp.getPredicate(root, criteria, criteriaBuilder), pageable);
//        return PageUtil.toPage(page.map(mapper::toDto));
    }
}
