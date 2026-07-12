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
@Table(name = "pay_platform")
public class Platform extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String domainName;

    private String contact;

    private Integer sort;

    private Boolean enabled;

    private String remark;

    @OneToMany(mappedBy = "platform")
    @JsonIgnoreProperties("platform")
    private List<Merchant> merchantList;
}
