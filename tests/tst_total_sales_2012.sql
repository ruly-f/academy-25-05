/*  
    This test ensures that the gross sales for 2012 match
    the audited accounting value:
    R$ 230,784.68
*/
with
    sales_2012 as (
        select sum(gross_total) as total
        from {{ ref('int_sales__metrics') }}
        where order_date between '2012-01-01' and '2012-12-31'
    )

select total
from sales_2012
where total not between 230784.66 and 230784.70
