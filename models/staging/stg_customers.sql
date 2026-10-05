select
    customer_id,
    customer_name,
    lower(email) as email,
    upper(state) as state
from {{ source('raw', 'customers') }}