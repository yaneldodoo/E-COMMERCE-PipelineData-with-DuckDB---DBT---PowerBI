with source as (
    select * from {{ source('raw', 'raw_products') }}
), 
renamed as (
    select product_id, 
    cast(product_name as varchar) as  nameproduct,
    cast(product_category as varchar) as category,
    from source 
)
select * from renamed
