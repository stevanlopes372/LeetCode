with
cleaned_units_sold as (
    select distinct
        product_id,
        purchase_date,
        units
    from UnitsSold
)

, calculated_data as (
select
    p.product_id,
    sum(p.price * coalesce(u.units, 0)) as total_sold
from Prices p
left join cleaned_units_sold u
    on p.product_id = u.product_id
    and purchase_date between start_date and end_date
group by 1
),

sum_units as (
    select
        product_id,
        sum(coalesce(units, 0)) as units_sold
    from cleaned_units_sold
    group by product_id
)

select
    p.product_id,
    coalesce(round(c.total_sold/s.units_sold, 2),0) as average_price
from
    Prices p
left join calculated_data c
    using(product_id)
left join sum_units s
    using(product_id)
group by p.product_id