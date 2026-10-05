with customer_orders as (

    select
        customer_id,
        count(*) as order_count,
        sum(order_revenue) as lifetime_revenue,
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date
    from {{ ref('fct_orders') }}
    group by customer_id

)

select
    c.customer_id,
    c.customer_name,
    c.email,
    c.state,

    coalesce(o.order_count, 0) as order_count,
    coalesce(o.lifetime_revenue, 0) as lifetime_revenue,
    o.first_order_date,
    o.most_recent_order_date

from {{ ref('stg_customers') }} c
left join customer_orders o
    on c.customer_id = o.customer_id