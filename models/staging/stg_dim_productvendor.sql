WITH stg_dim_productvendor AS(
    SELECT
        *
    FROM `adventureworks2019.Purchasing.ProductVendor`
)
    ,stg_dim_productvendor__rename__cast_type AS(
        SELECT
            CAST(ProductID as INTEGER) as productvendor_product_key
            ,CAST(BusinessEntityID as INTEGER) as productvendor_vendor_key
            ,CAST(AverageLeadTime as INTEGER) as average_lead_time
            ,CAST(StandardPrice as DECIMAL) as standard_price  
            ,CAST(MinOrderQty as INTEGER) as min_order_quantity
            ,CAST(MaxOrderQty as INTEGER) as max_order_quantity
            ,CAST(UnitMeasureCode as STRING) as unit_measure_code      
            FROM stg_dim_productvendor
    )

    SELECT
        *
    FROM stg_dim_productvendor__rename__cast_type