WITH stg_dim_productmodel AS (
  SELECT 
    *
  FROM  `adventureworks2019.Production.ProductModel`
)
,stg_dim_productmodel__rename__cast_type AS (
  SELECT
    CAST(ProductModelID AS INTEGER) AS product_model_key
    ,CAST(Name AS STRING) AS product_model_name
  FROM stg_dim_productmodel
)

SELECT
  *
FROM stg_dim_productmodel__rename__cast_type
