package me.zhengjie.modules.pay.entity.enums;

public enum PayMethod {
    ALI_PAY("alipay", "支付宝"),
    WX_PAY("wxpay", "微信支付");

    private final String value;
    private final String description;

    PayMethod(String value, String description) {
        this.value = value;
        this.description = description;
    }

    public String getValue() {
        return value;
    }

    public String getDescription() {
        return description;
    }
}
