with
    -- import models
    products as (
        select *
        from {{ ref('stg_erp__products') }}
    )
    , suppliers as (
        select *
        from {{ ref('stg_erp__suppliers') }}
    )
    , categories as (
        select *
        from {{ ref('stg_erp__categories') }}
    )
    -- transformation
    , joined as (
        select
            products.product_pk
            , products.product_name
            , products.quantity_per_unit
            , products.unit_price
            , products.units_in_stock
            , products.units_on_order
            , products.reorder_level
            , products.is_discontinued
            , suppliers.supplier_name
            , suppliers.supplier_city
            , suppliers.supplier_country
            , categories.category_name  
        from products
        left join suppliers on products.supplier_fk = suppliers.supplier_pk
        left join categories on products.category_fk = categories.category_pk
    ) 

select *
from joined