--Cap quyen user cho select va delete
create or replace procedure Grant_Priv_User1(User_Name in varchar2, priv in varchar2,table_name in varchar2, grant_option in varchar2)
authid current_user
is
    Tmp_count int;
begin
    select count(*)into Tmp_count from all_users where username=User_name;
    if(Tmp_count != 0) then
        if (grant_option ='YES') then
            execute immediate( 'Grant '||priv|| ' on ' || table_name|| ' to '|| User_name|| ' with grant option');
        elsif(grant_option='NO') then
            execute immediate('Grant '||priv|| ' on ' || table_name|| ' to '|| User_name);
        end if;
    else 
        RAISE_APPLICATION_ERROR(-20000,'User khong ton tai');
    end if;     
end;
--Cap quyen user cho insert va update
create or replace procedure Grant_Priv_User2(User_Name in varchar2, priv in varchar2,table_name in varchar2, col_name in varchar2, grant_option in varchar2)
authid current_user
is
    Tmp_count int;
begin
    select count(*)into Tmp_count from all_users where username=User_name;
    if(Tmp_count != 0) then
        if (grant_option ='YES') then
            execute immediate( 'Grant '||priv||'( '||col_name|| ') on ' || table_name|| ' to '|| User_name|| ' with grant option');
        elsif(grant_option='NO') then
            execute immediate('Grant '||priv||'( '||col_name|| ') on '  || table_name|| ' to '|| User_name);
        end if;
    else 
        RAISE_APPLICATION_ERROR(-20000,'User khong ton tai');
    end if;     
end;


--Thu hoi quyen user
create or replace procedure Revoke_Priv_User( User_name in varchar, priv in varchar2, table_name in varchar2)
authid current_user
is
    Tmp_count int;
begin
    select count(*) into Tmp_count from all_users where username=User_name;
    if(Tmp_count != 0) then
        execute immediate ('Revoke '||priv|| ' on '||table_name||' from ' ||User_name);
    else 
        RAISE_APPLICATION_ERROR(-20000, 'User khong ton tai');
    end if;
end;

begin
    Revoke_Priv_User('NV002','select','NHANVIEN');
end;

--Xem quyen user
create or replace procedure View_Priv_User( User_name in varchar2,v_cur out sys_refcursor)
is
    Tmp_count int;
begin
    select count(*) into Tmp_count from all_users where username=User_name;
    if(Tmp_count != 0) then
        open v_cur for select * from dba_tab_privs where GRANTEE = User_name;
    else 
        RAISE_APPLICATION_ERROR(-20000, 'User khong ton tai');
    end if;
end;
