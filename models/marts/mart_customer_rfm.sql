WITH base AS (
    SELECT
        customer_id,
        recency,
        nb_commandes AS frequency,
        ca_total AS monetary
    FROM {{ ref('mart_customer_metrics') }}
),

scored AS (
    SELECT
        *,
        NTILE(5) OVER (ORDER BY recency ASC) AS r_score,
        NTILE(5) OVER (ORDER BY frequency DESC) AS f_score,
        NTILE(5) OVER (ORDER BY monetary DESC) AS m_score
    FROM base
),

segmented AS (
    SELECT
        *,
        CASE
            WHEN r_score >= 4 AND f_score >= 4 AND m_score >= 4 THEN 'Champion'
            WHEN f_score >= 4 AND m_score >= 3 THEN 'Fidele'
            WHEN r_score <= 2 AND f_score <= 2 THEN 'Perdu'
            WHEN r_score <= 2 THEN 'A risque'
            ELSE 'En developpement'
        END AS segment
    FROM scored
)

SELECT * FROM segmented