package me.zhengjie.modules.pay.service.dto;

import lombok.Data;
import me.zhengjie.base.BaseDTO;
import me.zhengjie.base.BaseEntity;
import me.zhengjie.modules.pay.entity.PayMerchant;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Data
public class PayPlatformDto extends BaseDTO implements Serializable {
    private Long id;

    private String name;

    private String endpoint;

    private String website;

    private String contact;

    private String remark;

    private List<PayMerchantSmallDto> merchantList;
}
