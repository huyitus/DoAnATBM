----- Tao moi user
create or replace procedure Create_NewUser(User_name in varchar2,Pass_Word in nvarchar2)
authid current_user 
as
    Tmp_count int;
Begin
    select count(*) into Tmp_count from all_users where username = User_name;
    If(Tmp_count != 0) then
        RAISE_APPLICATION_ERROR(-20000,'User da ton tai'); 
    ELSE 
        execute immediate('Create user '|| User_name||' identified by '||Pass_Word);
        execute immediate('grant create session to '||User_name);
    END IF;
End;

----- Xoa user
create or replace procedure Drop_User(User_name in varchar2)
authid current_user 
as
    Tmp_count int;
Begin
    select count(*) into Tmp_count from all_users where username = User_name;
    If(Tmp_count != 0) then
        execute immediate('DROP USER '|| User_name);
    ELSE 
         RAISE_APPLICATION_ERROR(-20000,'User khong ton tai'); 
    END IF;
End;

-------Chinh sua password user
create or replace procedure Alter_User(User_name in varchar2,Pass_Word in varchar2)
authid current_user
is
    Tmp_count int;
Begin
    select count(*) into Tmp_count from all_users where username = User_name;
    If(Tmp_count != 0) then
        execute immediate('alter user '|| User_name||' identified by '||Pass_Word);
    ELSE 
            RAISE_APPLICATION_ERROR(-20000,'User khong ton tai'); 
    END IF;
END;

----- Xem danh sach user
create or replace view View_User
as
    select* from dba_users;
grant select on View_User to admin;

-----Test
BEGIN 
    Create_NewUser('NV001', 'NV001');
END;

    select * from View_User;

BEGIN 
    Alter_User('NV001','12345');
END;

BEGIN 
    Drop_User('NV001');
END;

--BEGIN
    --Drop_User(:name);
--END;
