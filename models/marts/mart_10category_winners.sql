select category, 
sum(payment) as ca, 
from stg_order_items oi
join  stg_payments p on oi.order_id=p.order_id
join stg_products p on oi.product_id=p.product_id
group by category
order by ca DESC
limit 10