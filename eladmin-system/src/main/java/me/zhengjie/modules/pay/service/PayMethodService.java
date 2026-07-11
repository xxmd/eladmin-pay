package me.zhengjie.modules.pay.service;

import me.zhengjie.modules.pay.entity.PayMethod;
import me.zhengjie.modules.pay.repository.PayMethodRepository;
import me.zhengjie.modules.pay.service.dto.PayMethodDto;
import me.zhengjie.modules.pay.service.dto.PayMethodSmallDto;
import me.zhengjie.modules.pay.service.mapstruct.PayMethodMapper;
import me.zhengjie.modules.pay.service.mapstruct.PayMethodSmallMapper;
import me.zhengjie.utils.PageResult;
import me.zhengjie.utils.PageUtil;
import me.zhengjie.utils.QueryHelp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;

@Service
@Transactional
public class PayMethodService {
    @Autowired
    private PayMethodRepository repository;
    @Autowired
    private PayMethodMapper mapper;
    @Autowired
    private PayMethodSmallMapper smallMapper;

    public void create(PayMethod entity) {
        repository.save(entity);
    }

    public void delete(Set<Long> idSet) {
        repository.deleteAllById(idSet);
    }

    public void update(PayMethod entity) {
        repository.save(entity);
    }

    public PageResult<PayMethodDto> read(Pageable pageable) {
        Page<PayMethod> page = repository.findAll((root, criteriaQuery, criteriaBuilder) -> QueryHelp.getPredicate(root, null, criteriaBuilder), pageable);
        return PageUtil.toPage(page.map(mapper::toDto));
    }

    public List<PayMethodSmallDto> findAll() {
        return smallMapper.toDto(repository.findAll());
    }
}
