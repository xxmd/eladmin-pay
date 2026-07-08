package me.zhengjie.modules.pay.service.dto;

import lombok.Data;
import me.zhengjie.base.BaseDTO;
import me.zhengjie.modules.pay.entity.PayMerchant;
import me.zhengjie.modules.pay.entity.enums.PayMethod;
import org.example.entity.enums.PayType;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;

@Data
public class PayOrderDto extends BaseDTO implements Serializable {
    private Long id;

    private String orderNumber;

    private String productName;

    private BigDecimal productPrice;

    private Integer productQuantity;

    private PayMethod payMethod;

    private String payUrl;

    private BigDecimal paidAmount;

    private String remark;

    private PayMerchantDto merchant;
}
