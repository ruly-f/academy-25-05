with
    -- import models
    employees as (
        select *
        from {{ ref('stg_erp__employees') }}
    )
    -- transformation
    , joined as (
        select
            employees.employee_pk
            , employees.employee_name
            , managers.employee_name as manager_name
            , employees.employee_title
            , employees.employee_birth_date
            , employees.employee_hire_date
            , employees.employee_city
            , employees.employee_region
            , employees.employee_country
        from employees
        left join employees as managers on employees.manager_fk = managers.employee_pk
    ) 

select *
from joined