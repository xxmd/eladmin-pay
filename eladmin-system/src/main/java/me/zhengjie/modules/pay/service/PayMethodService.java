package me.zhengjie.modules.pay.service;

import me.zhengjie.modules.pay.entity.Method;
import me.zhengjie.modules.pay.repository.MethodRepository;
import me.zhengjie.modules.pay.service.dto.MethodDto;
import me.zhengjie.modules.pay.service.mapstruct.MethodMapper;
import me.zhengjie.utils.QueryHelp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
@Transactional
public class PayMethodService {
    @Autowired
    private MethodRepository repository;
    @Autowired
    private MethodMapper mapper;

    public void create(Method entity) {
        repository.save(entity);
    }

    public void delete(Set<Long> idSet) {
        repository.deleteAllById(idSet);
    }

    public void update(Method entity) {
        repository.save(entity);
    }

    public Page<Method> read(Pageable pageable) {
        return repository.findAll((root, criteriaQuery, criteriaBuilder) -> QueryHelp.getPredicate(root, null, criteriaBuilder), pageable);
    }

    public List<MethodDto> findAll() {
        return mapper.toDto(repository.findAll());
    }
}
