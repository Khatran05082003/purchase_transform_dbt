WITH stg_dim_employee AS (
  SELECT 
    *
  FROM  `adventureworks2019.HumanResources.Employee`
)
  , stg_dim_employee__rename__cast_type AS (
    SELECT
      IFNULL(CAST(BusinessEntityID AS INTEGER), 0) AS employee_key
      ,IFNULL(CAST(JobTitle AS STRING), 'undefined') AS job_title
      ,IFNULL(CAST(Gender AS STRING), 'undefined') AS gender
    FROM stg_dim_employee
  )
  , stg_dim_employee__add_undefined_record AS (
    SELECT 
      employee_key
      ,job_title
      ,gender
    FROM stg_dim_employee__rename__cast_type

    UNION ALL

    SELECT
      0 AS employee_key
      ,'Undefined' AS job_title
      ,'Undefined' AS gender
  )
  SELECT
    *
  FROM stg_dim_employee__add_undefined_record
