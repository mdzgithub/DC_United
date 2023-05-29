{{ config(materialized="table") }}

with stg_fixtures as (select * from {{ ref("stg_fixtures") }})
select
    fixure_id,
    venue_name,
    nvl(LEFT(referee_name,CHARINDEX(',', referee_name) - 1), 'TBD') as referee_name,
    nvl(RIGHT(referee_name,CHARINDEX(',', (REVERSE(referee_name))) - 1), 'TBD') as referee_nationality,
    home_team,
    away_team,
    goal_home,
    goal_away
from stg_fixtures