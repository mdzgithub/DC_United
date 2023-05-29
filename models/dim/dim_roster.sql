{{ config(materialized="table") }}

with raw_roster as (select * from dc_united.raw.raw_roster)
select

    f.value:name::string as player_name,
    f.value:position::string as player_position,
    f.value:number::string as player_number,
    f.value:age::string as player_age
from raw_roster, table(flatten(json:response[0]:players)) f
