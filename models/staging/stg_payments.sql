with source as (
select * from {{ source('raw', 'raw_payments') }}
),
renamed as (
    select
        order_id,
        payment_type,
        CAST(payment_value AS DECIMAL(10,2)) AS payment
    from source
)

select * from renamed

