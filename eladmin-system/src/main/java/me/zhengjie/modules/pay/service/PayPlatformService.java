package me.zhengjie.modules.pay.service;

import me.zhengjie.modules.pay.entity.PayPlatform;
import me.zhengjie.modules.pay.entity.query.PayPlatformQueryCriteria;
import me.zhengjie.modules.pay.repository.PayPlatformRepository;
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
public class PayPlatformService {
    @Autowired
    private PayPlatformRepository repository;

    public void create(@Validated @RequestBody PayPlatform entity) {
        repository.save(entity);
    }

    public void delete(Set<Long> idSet) {
        repository.deleteAllById(idSet);
    }

    public void update(@Validated @RequestBody PayPlatform entity) {
        repository.save(entity);
    }

    public Page<PayPlatform> query(PayPlatformQueryCriteria criteria, Pageable pageable) {
        return repository.findAll((root, criteriaQuery, criteriaBuilder) -> QueryHelp.getPredicate(root, criteria, criteriaBuilder), pageable);
    }
}
