WITH dim_vendor AS (
  SELECT 
      *
    FROM {{ref("stg_dim_vendor")}} as stg_dim_vendor
    LEFT JOIN {{ref("stg_dim_productvendor")}} as stg_dim_productvendor
    ON stg_dim_vendor.vendor_key = stg_dim_productvendor.productvendor_vendor_key
    LEFT JOIN {{ref("stg_dim_unitmeasure")}} as stg_dim_unitmeasure
    ON stg_dim_productvendor.unit_measure_code = stg_dim_unitmeasure.unit_measure_key
)
  SELECT 
    vendor_key
    ,account_number
    ,vendor_name
    ,active_flag
    ,average_lead_time
    ,standard_price 
    ,min_order_quantity
    ,max_order_quantity
    ,unit_measure_code
    ,unit_measure_name
  FROM dim_vendor