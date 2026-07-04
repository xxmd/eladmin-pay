package me.zhengjie.modules.pay.repository;

import me.zhengjie.modules.pay.entity.PayMerchant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface PayMerchantRepository extends JpaRepository<PayMerchant, Long>, JpaSpecificationExecutor<PayMerchant> {
}
