package me.zhengjie.modules.pay.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;
import lombok.Setter;
import me.zhengjie.base.BaseEntity;

import javax.persistence.*;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "pay_merchant")
public class Merchant extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private int merchantId;

    @Column(name = "md5_secret_key")
    private String md5SecretKey;

    private Integer sort;

    private Boolean enabled;

    private String remark;

    @ManyToOne
    @JoinColumn(name = "platform_id")
    @JsonIgnoreProperties("merchantList")
    private Platform platform;

    @ManyToMany
    @JoinTable(name = "pay_merchant_method", joinColumns = @JoinColumn(name = "merchant_id"), inverseJoinColumns = @JoinColumn(name = "method_id"))
    @JsonIgnoreProperties("merchantList")
    private List<Method> methodList;
}
