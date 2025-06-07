with
    int_sales as (
        select *
        from {{ ref('int_sales__metrics') }}
    )

select *
from int_sales