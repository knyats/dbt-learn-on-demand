{% macro limit_data_in_dev(column_name, num_days = 3) %}

{%- if target.name == 'dev' -%}
where {{column_name}} >= dateadd('day', -{{num_days}}, current_timestamp)
{%- endif -%}
{%- endmacro %}