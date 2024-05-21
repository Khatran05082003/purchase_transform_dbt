WITH stg_dim_person AS (
  SELECT 
    *
  FROM  `adventureworks2019.Person.Person`
)
  , stg_dim_person__rename__cast_type AS (
    SELECT
      IFNULL(CAST(BusinessEntityID AS INTEGER), 0) AS person_key
      ,IFNULL(CAST(FirstName AS STRING), 'undefined') AS first_name
      ,IFNULL(CAST(MiddleName AS STRING), 'undefined') AS middle_name
      ,IFNULL(CAST(LastName AS STRING), 'undefined') AS last_name
    FROM stg_dim_person
  )
  , stg_dim_person__add_undefined_record AS (
    SELECT 
      person_key
      ,first_name
      ,middle_name
      ,last_name
    FROM stg_dim_person__rename__cast_type

    UNION ALL

    SELECT
      0 AS person_key
      ,'Undefined' AS first_name
      ,'Undefined' AS middle_name
      ,'Undefined' AS last_name
  )
  SELECT
    *
  FROM stg_dim_person__add_undefined_record
