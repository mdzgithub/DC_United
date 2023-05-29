{{ config(materialized="view") }}

with raw_fixtures as (select * from dc_united.raw.raw_fixtures)
select
 f.value:fixture.id::string as fixure_id,
 f.value:fixture.venue.name::string as venue_name,
 f.value:fixture.referee::string as referee_name,
 f.value:teams.home.name::string as home_team,
 f.value:teams.away.name::string as away_team,
 f.value:goals.home::integer as goal_home,
 f.value:goals.away::integer as goal_away
from raw_fixtures, table(flatten(json:response)) f