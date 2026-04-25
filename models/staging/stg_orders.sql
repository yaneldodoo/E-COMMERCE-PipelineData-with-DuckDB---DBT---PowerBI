WITH source AS (
    SELECT * FROM {{ source('raw', 'raw_orders') }}
),

renamed AS (
    SELECT
        order_id,
        customer_id,
        COALESCE(order_status, 'unknown') AS order_status,
        CAST(order_purchase_timestamp AS TIMESTAMP) AS ordered_at,
        CAST(order_approved_at AS TIMESTAMP) AS approved_at,
        CAST(order_delivered_timestamp AS TIMESTAMP) AS delivered_at,
        YEAR(order_purchase_timestamp) AS annee_de_commande,
        MONTH(order_purchase_timestamp) AS mois_de_commande
    FROM source
)

SELECT * FROM renamed


