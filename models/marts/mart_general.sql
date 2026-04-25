SELECT
    o.order_id,
    o.customer_id,
    o.order_status,
    o.ordered_at,
    c.city,
    c.etat,
    oi.product_id,
    oi.seller_id,
    oi.price,
    p.payment,
    p.typepaiement
FROM {{ ref('stg_orders') }} o
JOIN {{ ref('stg_customers') }} c
    ON o.customer_id = c.customer_id
JOIN {{ ref('stg_order_items') }} oi
    ON o.order_id = oi.order_id
JOIN {{ ref('stg_payments') }} p
    ON o.order_id = p.order_id