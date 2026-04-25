with source as (
    select * from {{ source('raw', 'raw_customers') }}
), 
renamed as (
    select customer_id, 
    cast(customer_city as varchar) as  city,
    cast(customer_state as varchar) as stateS
from source
)
select * from renamed 