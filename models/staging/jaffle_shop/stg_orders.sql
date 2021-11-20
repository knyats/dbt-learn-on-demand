with orders as (
    
    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

    from {{source('jaffle_shop', 'orders')}}
)

select * from orders
{{ limit_data_in_dev(column_name = 'order_date', num_days = 1440 ) }}