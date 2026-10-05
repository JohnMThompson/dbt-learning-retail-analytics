{{
    config(
        materialized='incremental',
        unique_key='order_id'
    )
}}

select
    o.order_id,
    o.customer_id,
    o.order_date,
    o.order_status,
    coalesce(sum(oi.line_revenue), 0) as order_revenue
from {{ ref('stg_orders') }} o
left join {{ ref('stg_order_items') }} oi
    on o.order_id = oi.order_id

{% if is_incremental() %}

where o.order_date > (
    select max(order_date)
    from {{ this }}
)

{% endif %}

group by
    o.order_id,
    o.customer_id,
    o.order_date,
    o.order_status