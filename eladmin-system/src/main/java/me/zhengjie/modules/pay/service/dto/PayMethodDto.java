package me.zhengjie.modules.pay.service.dto;

import lombok.Data;
import me.zhengjie.base.BaseDTO;
import me.zhengjie.modules.pay.entity.PayMerchant;

import java.io.Serializable;
import java.util.List;

@Data
public class PayMethodDto extends BaseDTO implements Serializable {
    private Long id;

    private String label;

    private String value;

    private List<PayMerchantSmallDto> payMerchantList;
}
