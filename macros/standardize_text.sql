{% macro standardize_text(column_name, force_upper=true) %}

    {% if force_upper %}
        upper(trim({{ column_name }}))
    {% else %}
        lower(trim({{ column_name }}))
    {% endif %}

{% endmacro %}