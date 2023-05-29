{{ config(materialized="table") }}

with raw_season as (select * from dc_united.raw.raw_season)
select 
    json:response.fixtures.wins.total :: integer as num_wins,
    json:response.fixtures.loses.total :: integer as num_loses,
    json:response.fixtures.draws.total :: integer as num_draws,
    json:response.fixtures.played.total :: integer as num_played
from raw_season