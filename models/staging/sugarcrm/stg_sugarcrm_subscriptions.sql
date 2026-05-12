select
    id as subscription_id,
    name as subscription_name,
    date_entered as created_at,
    date_modified as updated_at,
    deleted as is_deleted
from {{ source('sugarcrm', 'subsc_subscriptions') }}
