WITH source AS (
    SELECT * FROM {{ source('raw', 'raw_payments') }}
),
renamed AS (
    SELECT
        order_id,
        payment_type AS typepaiement,
        CAST(COALESCE(payment_value, 0) AS DECIMAL(10,2)) AS payment
    FROM source
)
SELECT * FROM renamed