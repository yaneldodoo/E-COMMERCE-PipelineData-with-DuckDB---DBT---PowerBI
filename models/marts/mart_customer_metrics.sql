WITH customer_orders AS (
    SELECT
        o.customer_id,
        o.order_id,
        o.ordered_at,
        p.payment
    FROM {{ ref('stg_orders') }} o
    JOIN {{ ref('stg_payments') }} p
        ON o.order_id = p.order_id
),

customer_metrics AS (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS nb_commandes,
        SUM(payment) AS ca_total,
        AVG(payment) AS panier_moyen,
        MIN(ordered_at) AS premier_achat,
        MAX(ordered_at) AS dernier_achat
    FROM customer_orders
    GROUP BY customer_id
)

SELECT
    customer_id,
    nb_commandes,
    ca_total,
    panier_moyen,
    premier_achat,
    dernier_achat,
    DATE_DIFF('day', DATE(dernier_achat), (
        SELECT MAX(DATE(ordered_at))
        FROM {{ ref('stg_orders') }}
    )) AS recency
FROM customer_metrics