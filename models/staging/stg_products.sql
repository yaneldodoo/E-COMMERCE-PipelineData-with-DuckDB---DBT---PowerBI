with source as (
    select * from {{ source('raw', 'raw_products') }}
), 
renamed as (
    select 
    cast(product_id as varchar) as  idproduct,
    cast(product_category_name as varchar) as category,
    from source 
)
select * from renamed
