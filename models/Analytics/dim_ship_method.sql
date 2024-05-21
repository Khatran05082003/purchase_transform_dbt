WITH dim_ship_method AS(
    SELECT
        *
    FROM `adventureworks2019.Purchasing.ShipMethod`
)
    ,dim_ship_method__rename__cast_type as(
        SELECT
            CAST(ShipMethodID as INTEGER) as ship_method_key
            ,CAST(Name as STRING) as ship_method_name
            ,CAST(ShipBase as DECIMAL) as ship_base
            ,CAST(ShipRate as DECIMAL) as ship_rate
        FROM dim_ship_method
    )

    SELECT
        *
    FROM dim_ship_method__rename__cast_type