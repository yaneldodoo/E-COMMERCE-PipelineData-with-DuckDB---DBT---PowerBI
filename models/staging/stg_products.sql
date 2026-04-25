with source as (
    select * from {{ source('raw', 'raw_products') }}
), 
renamed as (
    select product_id as product_id,
    cast(COALESCE(product_category_name, 'unknown') as varchar) as category,

    from source 
)
select * from renamed
