package me.zhengjie.modules.pay.service.query;

import lombok.Data;
import me.zhengjie.annotation.Query;

import java.sql.Timestamp;
import java.util.List;

@Data
public class MerchantQueryCriteria {
    @Query(type = Query.Type.EQUAL, propName = "id", joinName = "platform")
    private Long platformId;

    @Query(type = Query.Type.INNER_LIKE)
    private String merchantId;

    @Query(type = Query.Type.INNER_LIKE)
    private String md5SecretKey;

    @Query(type = Query.Type.BETWEEN)
    private List<Timestamp> updateTime;
}
