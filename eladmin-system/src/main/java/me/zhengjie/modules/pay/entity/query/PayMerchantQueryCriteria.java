package me.zhengjie.modules.pay.entity.query;

import lombok.Data;
import me.zhengjie.annotation.Query;

import java.sql.Timestamp;
import java.util.List;

@Data
public class PayMerchantQueryCriteria {
    @Query(type = Query.Type.EQUAL, propName = "id", joinName = "pay_platform")
    private Long platformId;

    @Query(type = Query.Type.INNER_LIKE)
    private String merchantId;

    @Query(type = Query.Type.INNER_LIKE)
    private String md5SecretKey;

    @Query(type = Query.Type.BETWEEN)
    private List<Timestamp> updateTime;
}
