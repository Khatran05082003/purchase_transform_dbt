WITH stg_dim_vendor AS(
    SELECT 
        *
    FROM `adventureworks2019.Purchasing.Vendor`
)
    ,stg_dim_vendor__rename__cast_type AS(
        SELECT 
           IFNULL(CAST(BusinessEntityID as INTEGER), 0) as vendor_key
           ,IFNULL(CAST(AccountNumber as STRING), 'undefined') as account_number
           ,IFNULL(CAST(Name as STRING), 'undefined') as vendor_name
           ,IFNULL(CAST(ActiveFlag as INTEGER), 0) as active_flag
        FROM stg_dim_vendor
    )
    
    ,stg_dim_vendor__add_undefined_record AS (
    SELECT 
        vendor_key
        ,account_number
        ,vendor_name
        ,active_flag
    FROM stg_dim_vendor__rename__cast_type

    UNION ALL
    SELECT
        0 as vendor_key
        ,'Undefined' as account_number
        ,'Undefined' as vendor_name
        ,0 as active_flag
    )
    
    SELECT
        *
    FROM stg_dim_vendor__add_undefined_record