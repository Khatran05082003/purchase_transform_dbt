WITH stg_fact_orderheader AS (
  SELECT 
    *
  FROM  `adventureworks2019.Purchasing.PurchaseOrderHeader`
)
    ,stg_fact_orderheader__rename__cast_type as(
        SELECT
            CAST(PurchaseOrderID as INTEGER) as purchase_order_key_header
            ,CAST(EmployeeID as INTEGER) as employee_key_fact
            ,CAST(VendorID as INTEGER) as vendor_key_fact
            ,CAST(ShipMethodID as INTEGER) ship_method_key_fact
            ,CAST(OrderDate AS DATE) AS order_date_key_fact
            ,CAST(Status as INTEGER) as purchase_order_status
            ,CAST(TaxAmt as DECIMAL) as tax_amount
            ,CAST(SubTotal  as DECIMAL) as sub_total
            ,CAST(TotalDue as DECIMAL) as total_due
            ,CAST(Freight as DECIMAL) as freight
        FROM stg_fact_orderheader
    )

    SELECT
        *
    FROM stg_fact_orderheader__rename__cast_type