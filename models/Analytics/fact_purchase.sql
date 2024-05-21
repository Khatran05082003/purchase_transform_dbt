WITH fact_purchase AS (
  SELECT 
      *
    FROM {{ref("stg_fact_orderdetail")}} as stg_fact_orderdetail
    LEFT JOIN {{ref("stg_fact_orderheader")}} as stg_fact_orderheader
    ON stg_fact_orderdetail.purchase_order_key = stg_fact_orderheader.purchase_order_key_header
    LEFT JOIN {{ref("dim_product")}} as dim_product
    ON stg_fact_orderdetail.product_key_fact = dim_product.product_key
    LEFT JOIN {{ref("dim_vendor")}} as dim_vendor
    ON dim_vendor.vendor_key = stg_fact_orderheader.vendor_key_fact
    LEFT JOIN {{ref("dim_employee")}} as dim_employee
    ON dim_employee.employee_key = stg_fact_orderheader.employee_key_fact
    LEFT JOIN {{ref("dim_ship_method")}} as dim_ship_method
    ON dim_ship_method.ship_method_key = stg_fact_orderheader.ship_method_key_fact
    LEFT JOIN {{ref("dim_date")}} as dim_date
    ON dim_date.date_key = stg_fact_orderheader.order_date_key_fact
)
  SELECT
    ROW_NUMBER() OVER (ORDER BY purchase_order_key) AS purchase_order_line_key
    ,purchase_order_key
    ,product_key
    ,vendor_key
    ,employee_key
    ,ship_method_key
    ,date_key as order_date_key
    ,purchase_order_status
    ,order_quantity
    ,unit_price
    ,tax_amount
    ,sub_total
    ,total_due
    ,freight
    ,line_total
  FROM fact_purchase