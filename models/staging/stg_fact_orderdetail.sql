WITH stg_fact_orderdetail AS (
  SELECT 
    *
  FROM  `adventureworks2019.Purchasing.PurchaseOrderDetail`
)
    ,stg_fact_orderdetail__rename__cast_type as(
        SELECT
            CAST(PurchaseOrderID as INTEGER) as purchase_order_key
            ,CAST(ProductID as INTEGER) as product_key_fact
            ,CAST(OrderQty as INTEGER) as order_quantity
            ,CAST(UnitPrice as DECIMAL) as unit_price
            ,CAST(LineTotal as DECIMAL) as line_total
        FROM stg_fact_orderdetail
    )

    SELECT
        *
    FROM stg_fact_orderdetail__rename__cast_type
    