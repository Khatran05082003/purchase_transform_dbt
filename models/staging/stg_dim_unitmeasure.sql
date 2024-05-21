WITH stg_dim_unitmeasure AS(
    SELECT
        *
    FROM `adventureworks2019.Production.UnitMeasure`
)
    ,stg_dim_unitmeasure__rename__cast_type as(
        SELECT
            CAST(UnitMeasureCode as STRING) as unit_measure_key
            ,CAST(Name as STRING) as unit_measure_name
        FROM stg_dim_unitmeasure
    )

    SELECT
        *
    FROM stg_dim_unitmeasure__rename__cast_type