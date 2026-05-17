create warehouse fivetran_wh
with
warehouse_size='xsmall'
auto_suspend=60
auto_resume=TRUE ;

use warehouse fivetran_wh;

create or replace database fivetran_db;

use database fivetran_db;

create schema raw;

create role fivetran_role;

create user fivetran_user
password='Srijan@123'
default_role=fivetran_role
default_warehouse=fivetran_wh
must_change_password=FALSE;

grant role fivetran_role to user fivetran_user;

-- ware house access
grant usage on warehouse fivetran_wh to role fivetran_role;

grant usage on database fivetran_db to role fivetran_role;

grant usage on schema fivetran_db.raw to role fivetran_role;

grant create table on schema fivetran_db.raw to fivetran_role;

grant create stage on schema fivetran_db.raw to fivetran_role;

grant create file format on schema fivetran_db.raw to fivetran_role;

-- check everyroles
show grants to role fivetran_role;
