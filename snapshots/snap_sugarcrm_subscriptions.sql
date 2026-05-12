{% snapshot snap_sugarcrm_subscriptions %}

{{
    config(
      target_schema='dbt_snapshots',
      unique_key='subscription_id',
      strategy='timestamp',
      updated_at='updated_at'
    )
}}

select
    subscription_id,
    subscription_name,
    status,
    updated_at,
    is_deleted
from {{ ref('stg_sugarcrm_subscriptions') }}

{% endsnapshot %}
