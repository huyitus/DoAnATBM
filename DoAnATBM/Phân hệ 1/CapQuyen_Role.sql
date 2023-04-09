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

/

--xem quyen role
create or replace procedure view_priv_role (role_name in varchar2, cur out sys_refcursor)
as
    tmp_count int;
begin
    select count(*) into tmp_count from session_roles;
    if(tmp_count != 0) then
        open cur for select * from role_tab_privs where role = role_name; 
    else 
        dbms_output.put_line('Role khong ton tai');
    end if;
end;

