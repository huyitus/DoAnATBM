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

<<<<<<< HEAD
----- Xóa user 
create or replace procedure Drop_User(User_name in varchar2)
authid current_user
as
    Tmp_count int;
Begin
    select count(*) into Tmp_count from all_users where username = User_name;
    if(Tmp_count != 0) then
        execute immediate('DROP USER'||User_name);
    else
    RAISE_APPLICATION_ERROR(-20000,'User khong ton tai');
    end if;
End;
=======
>>>>>>> 019471cafd1c937f441929df7b7048fdeb1b570c
--Test
BEGIN 
    Create_NewUser('NV001', 'NV001');
END;

BEGIN 
    Drop_User('NV001');
END;
exec Drop_User('NV001');

drop user NV001;
select * from dba_users;
