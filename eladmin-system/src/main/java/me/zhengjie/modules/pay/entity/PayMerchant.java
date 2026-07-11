package me.zhengjie.modules.pay.entity;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import me.zhengjie.base.BaseEntity;

import javax.persistence.*;
import java.util.List;

@Getter
@Setter
@Entity
public class PayMerchant extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private int merchantId;

    @Column(name = "md5_secret_key")
    private String md5SecretKey;

    private Integer sort;

    private Boolean enable;

    private String remark;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "platform_id")
    private PayPlatform platform;

    @ManyToMany
    @JoinTable(name = "pay_merchant_method", joinColumns = @JoinColumn(name = "merchant_id"), inverseJoinColumns = @JoinColumn(name = "method_id"))
    private List<PayMethod> payMethodList;
}
