SELECT
    DATE(ordered_at) AS jour,
    SUM(payment) AS ca
FROM {{ ref('stg_orders') }} o
JOIN {{ ref('stg_payments') }} p
    ON o.order_id = p.order_id
GROUP BY DATE(ordered_at)