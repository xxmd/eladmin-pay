package me.zhengjie.modules.pay.service;

import me.zhengjie.modules.pay.entity.PayPlatform;
import me.zhengjie.modules.pay.entity.query.PayPlatformQueryCriteria;
import me.zhengjie.modules.pay.repository.PayPlatformRepository;
import me.zhengjie.modules.pay.service.dto.PayPlatformDto;
import me.zhengjie.modules.pay.service.mapstruct.PayPlatformMapper;
import me.zhengjie.utils.PageResult;
import me.zhengjie.utils.PageUtil;
import me.zhengjie.utils.QueryHelp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Set;

@Service
@Transactional
public class PayPlatformService {
    @Autowired
    private PayPlatformRepository repository;
    @Autowired
    private PayPlatformMapper mapper;

    public void create(PayPlatform entity) {
        repository.save(entity);
    }

    public void delete(Set<Long> idSet) {
        repository.deleteAllById(idSet);
    }

    public void update(PayPlatform entity) {
        repository.save(entity);
    }

    public PageResult<PayPlatformDto> read(PayPlatformQueryCriteria criteria, Pageable pageable) {
        Page<PayPlatform> page = repository.findAll((root, criteriaQuery, criteriaBuilder) -> QueryHelp.getPredicate(root, criteria, criteriaBuilder), pageable);
        return PageUtil.toPage(page.map(mapper::toDto));
    }
}
