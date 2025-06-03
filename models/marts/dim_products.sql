with
    int_products as (
        select *
        from {{ ref('int_products__enriched') }}
    )

select *
from int_products