package me.zhengjie.modules.pay.service;

import me.zhengjie.modules.pay.entity.Merchant;
import me.zhengjie.modules.pay.service.dto.MerchantDto;
import me.zhengjie.modules.pay.service.query.MerchantQueryCriteria;
import me.zhengjie.modules.pay.repository.MerchantRepository;
import me.zhengjie.modules.pay.service.mapstruct.MerchantMapper;
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
public class PayMerchantService {
    @Autowired
    private MerchantRepository repository;
    @Autowired
    private MerchantMapper mapper;

    public void create(Merchant entity) {
        repository.save(entity);
    }


    public void delete(Set<Long> idSet) {
        repository.deleteAllById(idSet);
    }

    public void update(Merchant entity) {
        repository.save(entity);
    }

    public Page<Merchant> read(MerchantQueryCriteria criteria, Pageable pageable) {
        return repository.findAll((root, criteriaQuery, criteriaBuilder) -> QueryHelp.getPredicate(root, criteria, criteriaBuilder), pageable);
    }

    public List<MerchantDto> findAll() {
        return mapper.toDto(repository.findAll());
    }
}
