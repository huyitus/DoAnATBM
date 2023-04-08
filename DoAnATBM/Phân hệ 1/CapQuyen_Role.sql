alter session set "_oracle_script"=true;

--phan quyen cho role
create or replace procedure grant_privilege_to_role (role_name in varchar2, privilege_name in varchar2, table_name in varchar2)
authid current_user
as
    tmp_query varchar2(100);
begin
    tmp_query := 'Grant '||privilege_name|| 'on '||table_name||' to '||role_name;
    execute immediate (tmp_query);
end;

/

--thu hoi quyen cua role
create or replace procedure revoke_privilege_to_role (role_name in varchar2, privilege_name in varchar2, table_name in varchar2)
authid current_user
as
    tmp_query varchar2(100);
begin
    tmp_query := 'Revoke '||privilege_name|| 'on '||table_name||' to '||role_name;
    execute immediate (tmp_query);
end;