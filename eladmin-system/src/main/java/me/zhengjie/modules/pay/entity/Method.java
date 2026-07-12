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
@Table(name = "pay_method")
public class Method extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String label;

    private String value;

    private String remark;

    @ManyToMany(mappedBy = "methodList")
    @JsonIgnoreProperties(value = {"platform", "methodList"})
    private List<Merchant> merchantList;

//    @OneToMany(mappedBy = "method")
//    @JsonIgnoreProperties(value = {"merchant", "method"})
//    private List<Order> orderList;
}
