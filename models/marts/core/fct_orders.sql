with orders as(
    select * from {{ref('stg_orders')}}
),

payments as(
    select * from {{ref('stg_payments')}}
),

order_payments as (
    select 
        order_id,
        sum(case when status = 'success' then amount else 0 end) as amount
    from payments
    group by 1
)

select orders.order_id,
orders.customer_id,
order_payments.amount as amount,
orders.order_date
from orders left join order_payments using(order_id)
