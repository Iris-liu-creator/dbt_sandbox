with snapshot_versions as (

    select
        subscription_id,
        status,
        dbt_valid_from,
        dbt_valid_to,
        lag(status) over (
            partition by subscription_id
            order by dbt_valid_from
        ) as old_status

    from {{ ref('snap_sugarcrm_subscriptions') }}

)

select
    subscription_id,
    'status' as field_name,
    old_status as old_value,
    status as new_value,
    dbt_valid_from as value_change_date

from snapshot_versions

where old_status is not null
  and old_status <> status
