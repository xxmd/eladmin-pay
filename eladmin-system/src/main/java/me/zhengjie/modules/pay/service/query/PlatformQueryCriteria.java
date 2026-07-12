package me.zhengjie.modules.pay.service.query;

import lombok.Data;
import me.zhengjie.annotation.Query;

import java.sql.Timestamp;
import java.util.List;

@Data
public class PlatformQueryCriteria {
    @Query(type = Query.Type.INNER_LIKE)
    private String name;

    @Query(type = Query.Type.INNER_LIKE)
    private String domainName;

    @Query(type = Query.Type.BETWEEN)
    private List<Timestamp> updateTime;
}
