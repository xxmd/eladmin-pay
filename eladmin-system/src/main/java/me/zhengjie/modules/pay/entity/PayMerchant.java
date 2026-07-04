package me.zhengjie.modules.pay.entity;

import lombok.Data;
import me.zhengjie.base.BaseEntity;

import javax.persistence.*;

@Data
@Entity
public class PayMerchant extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long merchantId;

    private String md5SecretKey;

    private String remark;

    @OneToOne
    private PayPlatform platform;
}
