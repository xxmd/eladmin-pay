package me.zhengjie.modules.pay.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;
import lombok.Setter;
import me.zhengjie.base.BaseEntity;
import me.zhengjie.modules.pay.entity.enums.PayStatus;

import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;

@Getter
@Setter
@Entity
@Table(name = "pay_order")
public class Order extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String orderNumber;

    private String productName;

    private BigDecimal productPrice;

    private Integer productQuantity;

    private String payUrl;

    @Enumerated(EnumType.STRING)
    private PayStatus payStatus = PayStatus.UNPAID;

    private Date payTime;

    private String notifyParam;

    private String remark;

    @ManyToOne
    @JoinColumn(name = "merchant_id")
    @JsonIgnoreProperties(value = {"methodList"})
    private Merchant merchant;

    @ManyToOne
    @JoinColumn(name = "method_id")
    @JsonIgnoreProperties(value = {"merchantList"})
    private Method method;

    public BigDecimal getTotalAmount() {
        if (productPrice == null || productQuantity == null) {
            return BigDecimal.ZERO;
        }
        return productPrice.multiply(BigDecimal.valueOf(productQuantity));
    }
}
