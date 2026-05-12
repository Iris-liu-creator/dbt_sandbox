select
    *
from {{ source('sugarcrm', 'subsc_subscriptions') }}
