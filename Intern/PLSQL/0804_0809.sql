SET SERVEROUTPUT ON

--16. Trigger
--16.1 DML trigger
--16.1.1 simple DML trigger
--16.1.1.1 statement-level DML trigger
drop table t1 purge;
create table t1 (c1 number);

create or replace trigger trg_t1_b_i_s
    before insert on t1
begin
  dbms_output.put_line ('B');
end;
/

create or replace trigger trg_t1_a_i_s
    after insert on t1
begin
  dbms_output.put_line ('A');
end;
/

insert into t1 (c1) values (1);

select trigger_name, trigger_type, triggering_event, table_owner, table_name, status
  from user_triggers
 where trigger_name in ('TRG_T1_B_I_S', 'TRG_T1_A_I_S');


drop table t1 purge;
create table t1 as select 1 as c1, 1 as c2 from dual;

create or replace trigger trg_t1_b_u_s_1
    before update of c2 on t1
begin
  dbms_output.put_line('B1');
end;
/

create or replace trigger trg_t1_b_u_s_2
    before update of c2 on t1
begin
  dbms_output.put_line('B2');
end;
/

update t1 set c2 = 2 where c1 select when_clause from user_triggers where trigger_name = 'TRG_T1_B_I_R';= 1;

select trigger_name, table_owner, table_name, column_name 
    from user_trigger_cols
 where trigger_name = 'TRG_T1_B_U_S_1';


create or replace trigger trg_t1_b_u_s_2
    before update of c2 on t1
    follows trg_t1_b_u_s_1
begin
  dbms_output.put_line('B2');
end;
/

update t1 set c2 = 2 where c1 = 1;

alter trigger trg_t1_b_u_s_1 disable;

alter table t1 disable all triggers;

drop trigger trg_t1_b_u_s_2;


--16.1.1.2 row-level DML trigger
drop table t1 purge;
create table t1 (c1 number);

create or replace trigger trg_t1_b_iud_r
    before insert or update or delete on t1
    for each row
begin
  dbms_output.put_line (:OLD.c1 || ', ' || :NEW.c1);
end;
/

insert into t1 (c1) values (1);
update t1 set c1 = 2;
delete t1;

create or replace trigger trg_t1_b_iud_r
    before insert or update or delete on t1
    referencing old as bf new as af
    for each row
begin
  dbms_output.put_line (:bf.c1 || ',' || :af.c1);
end;
/

select referencing_names from user_triggers where trigger_name = 'TRG_T1_B_IUD_R';

drop table t1 purge;
create table t1 (c1 number, c2 number);

create or replace trigger trg_t1_b_i_r
    before insert on t1
    for each row
    when (new.c1 >= 3)
begin
  :new.c2 := 0;
end;
/

insert into t1 (c1, c2) select rownum, rownum from xmltable ('1 to 3');

select * from t1;

select when_clause from user_triggers where trigger_name = 'TRG_T1_B_I_R';


--16.1.1.3 order of execution
drop table t1 purge;
create table t1 (c1 number);

create or replace trigger trg_t1_b_i_s
    before insert on t1
begin
  dbms_output.put_line ('BS');
end;
/

create or replace trigger trg_t1_a_i_s
    after insert on t1
begin
  dbms_output.put_line ('AS');
end;
/

create or replace trigger trg_t1_b_i_r
    before insert on t1
    for each row
begin
  dbms_output.put_line ('BR');
end;
/

create or replace trigger trg_t1_a_i_r
    after insert on t1
    for each row
begin
  dbms_output.put_line ('AR');
end;
/

insert into t1 (c1) values (1);
/*return: BS BR AR AS*/

