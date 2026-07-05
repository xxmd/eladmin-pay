package me.zhengjie.modules.pay.service.dto;

import lombok.Data;
import me.zhengjie.base.BaseDTO;
import me.zhengjie.modules.pay.entity.PayMerchant;
import me.zhengjie.modules.pay.entity.PayPlatform;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.io.Serializable;
import java.util.List;

@Data
public class PayMerchantDto extends BaseDTO implements Serializable {
    private Long id;

    private Long merchantId;

    private String md5SecretKey;

    private String remark;

    private PayPlatformSmallDto platform;
}
