package me.zhengjie.modules.pay.entity.query;

import lombok.Data;
import me.zhengjie.annotation.Query;

import java.sql.Timestamp;
import java.util.List;

@Data
public class PayApiQueryCriteria {
    @Query(type = Query.Type.INNER_LIKE)
    private String name;

    @Query(type = Query.Type.INNER_LIKE)
    private String endpoint;

    @Query(type = Query.Type.BETWEEN)
    private List<Timestamp> updateTime;
}
