{% macro cleanup_learning_objects() %}

    {% do run_query("drop table if exists main.my_first_dbt_model") %}
    {% do run_query('drop table if exists main."order"') %}

{% endmacro %}