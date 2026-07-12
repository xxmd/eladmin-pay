package me.zhengjie.modules.pay.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import org.apache.commons.lang3.StringUtils;

@Data
public class EPayNotifyParam {
    private Integer pid;

    @JsonProperty(value = "trade_no")
    private String tradeNo;

    @JsonProperty(value = "out_trade_no")
    private String outTradeNo;

    private String type;

    private String name;

    private String money;

    @JsonProperty(value = "trade_status")
    private String tradeStatus;

    private String sign;

    @JsonProperty(value = "sign_type")
    private String signType;

    public boolean isValid() {
        return pid != null
                && StringUtils.isNotBlank(tradeNo)
                && StringUtils.isNotBlank(outTradeNo)
                && StringUtils.isNotBlank(type)
                && StringUtils.isNotBlank(name)
                && StringUtils.isNotBlank(money)
                && StringUtils.isNotBlank(tradeStatus)
                && StringUtils.isNotBlank(sign)
                && StringUtils.isNotBlank(signType);
    }
}
