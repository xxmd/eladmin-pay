package me.zhengjie.modules.pay.service;

import me.zhengjie.modules.pay.entity.Platform;
import me.zhengjie.modules.pay.service.query.PlatformQueryCriteria;
import me.zhengjie.modules.pay.repository.PlatformRepository;
import me.zhengjie.modules.pay.service.dto.PlatformDto;
import me.zhengjie.modules.pay.service.mapstruct.PlatformMapper;
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
public class PayPlatformService {
    @Autowired
    private PlatformRepository repository;
    @Autowired
    private PlatformMapper mapper;

    public void create(Platform entity) {
        repository.save(entity);
    }

    public void delete(Set<Long> idSet) {
        repository.deleteAllById(idSet);
    }

    public void update(Platform entity) {
        repository.save(entity);
    }

    public Page<Platform> read(PlatformQueryCriteria criteria, Pageable pageable) {
        return repository.findAll((root, criteriaQuery, criteriaBuilder) -> QueryHelp.getPredicate(root, criteria, criteriaBuilder), pageable);
    }

    public List<PlatformDto> findAll() {
        return mapper.toDto(repository.findAll());
    }
}
