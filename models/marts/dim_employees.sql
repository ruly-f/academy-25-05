with
    int_employees as (
        select *
        from {{ ref('int_employees__self_join') }}
    )

select *
from int_employees