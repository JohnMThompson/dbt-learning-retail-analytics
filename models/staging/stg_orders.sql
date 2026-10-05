select
    order_id,
    customer_id,
    cast(order_date as date) as order_date,
    lower(status) as order_status
from {{ source('raw', 'orders') }}