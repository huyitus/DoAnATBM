alter session set "_oracle_script"=true;

--tao role
create or replace procedure create_role(role_name in varchar2, pass_word in varchar2)
authid current_user
as
    tmp_query varchar(100);
begin 
    if(pass_word = ' ') then
    tmp_query := 'Create role '||role_name;
    end if;
    tmp_query := 'Create role '||role_name||' identified by '||pass_word;
    execute immediate (tmp_query);
    exception 
    when others then
        dbms_output.put_line('Role da ton tai');
        raise;
end;

/

--xoa role
create or replace procedure drop_role(role_name in varchar2)
authid current_user
as
    tmp_query varchar(100);
begin
    tmp_query := 'Drop role '||role_name;
    execute immediate (tmp_query);
    exception
    when others then
        dbms_output.put_line('Role khong ton tai');
        raise;
end;

/

--chinh sua role
create or replace procedure alter_role(role_name in varchar2, pass_word in varchar2)
authid current_user
as
    tmp_query varchar(100);
begin
    if(pass_word = ' ') then
    tmp_query := 'Alter role '||role_name||' not identified';
    execute immediate (tmp_query);
    else 
    tmp_query := 'Alter role '||role_name|| ' identified by '||pass_word;
    execute immediate (tmp_query);
    end if;
end;                        
    
/

--xem danh sach role
create or replace view View_Role
as
    select* from dba_roles;
grant select on View_Role to admin;

--test
begin
    create_role('role1', '123');
end;

select * from View_Role;

begin
    drop_role('role1');
end;

begin
    alter_role('role1','456');
end;



