select
    id as subscription_id,
    name as subscription_name,
    status,
    date_modified::timestamp as updated_at,
    deleted::boolean as is_deleted,
    _fivetran_synced

from {{ source('sugarcrm', 'subsc_subscriptions') }}