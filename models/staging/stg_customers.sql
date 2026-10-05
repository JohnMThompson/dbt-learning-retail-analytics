select
    customer_id,
    customer_name,
    lower(email) as email,
    {{ standardize_text('state') }} as state
from {{ source('raw', 'customers') }}