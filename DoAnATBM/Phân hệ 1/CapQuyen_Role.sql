alter session set "_oracle_script"=true;

--phan quyen cho role
create or replace procedure grant_privilege_to_role (role_name in varchar2, privilege_name in varchar2, table_name in varchar2)
as
begin
    execute immediate ('Grant '||privilege_name|| 'on '||table_name||' to '||role_name);
end;

/

--phan quyen cho role co with grant option
create or replace procedure grant_priv_to_role_with_grant_option (role_name in varchar2, privilege_name in varchar2, table_name in varchar2, withGrantOption in varchar2)
as
begin
    execute immediate ('Grant '||privilege_name|| 'on '||table_name||' to '||role_name||' '||withGrantOption);
end;

/

--thu hoi quyen cua role
create or replace procedure revoke_privilege_to_role (role_name in varchar2, privilege_name in varchar2, table_name in varchar2)
as
begin
    execute immediate ('Revoke '||privilege_name|| 'on '||table_name||' from '||role_name);
end;

