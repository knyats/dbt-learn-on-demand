with payments as(
    Select
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status as status,
        {{ cents_to_dollars('amount') }} as amount,
        created as created_at
    FROM {{source('stripe', 'payment')}}
)

SELECT * FROM payments