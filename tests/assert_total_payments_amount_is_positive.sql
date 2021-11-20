select
    order_id,
    sum(amount) total_amount
from {{ ref('stg_payments')}}
group by 1
having total_amount < 0