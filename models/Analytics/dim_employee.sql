WITH dim_employee AS (
  SELECT 
      *
    FROM {{ref("stg_dim_employee")}} as stg_dim_employee
    LEFT JOIN {{ref("stg_dim_person")}} as stg_dim_person
    ON stg_dim_employee.employee_key = stg_dim_person.person_key
)
  
  SELECT
    employee_key
    ,job_title
    ,gender
    ,first_name
    ,middle_name
    ,last_name
    FROM dim_employee

  
  
