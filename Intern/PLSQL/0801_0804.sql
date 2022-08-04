SET SERVEROUTPUT ON
-- SELECT * FROM USER_ERRORS;

--Q1 check transaction with multy session
CREATE TABLE t1 (c1 NUMBER(1));
INSERT INTO t1 VALUES (1);

SELECT * FROM t1;

DROP TABLE t1;

COMMIT;


--Q2
--function
CREATE OR REPLACE FUNCTION f1 (i_v1 IN NUMBER)
    RETURN NUMBER
IS
    v1 NUMBER := i_v1;
BEGIN
    RETURN v1 + 1;
EXCEPTION
    WHEN OTHERS THEN RETURN NULL;
END;
/

--procedure
CREATE OR REPLACE PROCEDURE p
IS
    s1 VARCHAR2(20) := 'Hello,World!';
BEGIN
    DBMS_OUTPUT.PUT_LINE (s1);
END;
/

--package spec / body
CREATE OR REPLACE PACKAGE pkg
IS
    pv1 NUMBER := 0;
    PROCEDURE p1;
END;
/

CREATE OR REPLACE PACKAGE BODY pkgSELECT * FROM USER_ERRORS;
IS
    gv1 NUMBER := 0;

    PROCEDURE  p1
    IS
        v1 NUMBER := 0;
    BEGIN
        pv1 := pv1 + 1;
        gv1 := gv1 + 1;
        v1 := v1 + 1;

        DBMS_OUTPUT.PUT_LINE (pv1);
        DBMS_OUTPUT.PUT_LINE (gv1);
        DBMS_OUTPUT.PUT_LINE (v1);
    END;
END;
/

EXEC pkg.p1

BEGIN
    pkg.pv1 := pkg.pv1 + 1;
    DBMS_OUTPUT.PUT_LINE (pkg.pv1);
END;
/

--object type spec / body
CREATE OR REPLACE TYPE t_person FORCE IS OBJECT(
    id NUMBER, name VARCHAR2(10), birthdate DATE);
/

CREATE OR REPLACE TYPE t_person FORCE IS OBJECT(
    id NUMBER, name VARCHAR2(10), birthdate DATE
  , CONSTRUCTOR FUNCTION t_person (i_id IN NUMBER, i_name IN VARCHAR)
    RETURN SELF AS RESULT
);
/

CREATE OR REPLACE TYPE BODY t_person
IS
    CONSTRUCTOR FUNCTION t_person (i_id IN NUMBER, i_name IN VARCHAR)
        RETURN SELF AS RESULT
    IS
    BEGIN
        id := i_id;
        name := i_name;
        RETURN;
    END;
END;
/
/*
Warning: TYPE created with compilation errors.
CREATE OR REPLACE TYPE t_person FORCE IS OBJECT(
                                ^^^^^
ERROR             -15002
*/

--Q3
--if
VAR b1 NUMBER

BEGIN
    IF      :b1 = 1 THEN
        DBMS_OUTPUT.PUT_LINE ('A');
    ELSIF  :b1 = 2 THEN
        DBMS_OUTPUT.PUT_LINE ('B');
    ELSE
        DBMS_OUTPUT.PUT_LINE ('C');
    END IF;
END;
/

EXEC :b1 := 2
/

--for
BEGIN
    FOR i IN 1 .. 3 LOOP
        DBMS_OUTPUT.PUT_LINE (i);    
    END LOOP;
END;
/

--label / goto
DECLARE
    i PLS_INTEGER := 1;
    j PLS_INTEGER := 1;
BEGIN
    <<outer>>
    LOOP
        i := i + 1;
        j := 1;

        <<inner>>
        LOOP
            DBMS_OUTPUT.PUT_LINE (i || ' * ' || j || ' = ' || i * j);
            j := j + 1;
            EXIT outer WHEN i * j > 81;
            EXIT inner WHEN j > 9;
        END LOOP inner;
    END LOOP outer;
END;
/

BEGIN
    <<outer>>
    FOR i IN 1 .. 2 LOOP
      <<inner>>
      FOR i IN 1 .. 2 LOOP
        DBMS_OUTPUT.PUT_LINE (outer.i || ', ' || inner.i);
      END LOOP inner;
    END LOOP outer;
END;
/

BEGIN
    GOTO label;
    DBMS_OUTPUT.PUT_LINE ('A');
    <<label>>
    DBMS_OUTPUT.PUT_LINE ('B');
END;
/
--exception
DECLARE 
    v1 NUMBER;
BEGIN
    v1 := 1 / 0;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE (SQLCODE);
END;
/

DECLARE 
    v1 NUMBER;
BEGIN
    v1 := 1 / 0;
EXCEPTION
    WHEN OTHERS THEN
        CASE SQLCODE
            WHEN -5070 THEN
                DBMS_OUTPUT.PUT_LINE ('X');
            ELSE
                DBMS_OUTPUT.PUT_LINE ('Y');
        END CASE;
END;
/

DECLARE 
    v1 NUMBER;
BEGIN
    v1 := 1 / 0;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE (SQLERRM);
END;
/

EXEC DBMS_OUTPUT.PUT_LINE (SQLERRM(-5070))

DECLARE 
    v1 NUMBER;
BEGIN
    v1 := 1 / 0;
EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE ('X');
END;
/

DECLARE 
    v1 NUMBER;
BEGIN
    v1 := 'A';
EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE ('X');
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE ('Y');
END;
/

DECLARE 
    v1 NUMBER;
BEGIN
    v1 := 'A';
EXCEPTION
    WHEN ZERO_DIVIDE OR VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE ('X');
END;
/

DECLARE 
    v1 NUMBER;
    e1 EXCEPTION;
    PRAGMA EXCEPTION_INIT (e1, -5070);
BEGIN
    v1 := 1 / 0;
EXCEPTION
    WHEN e1 THEN
        DBMS_OUTPUT.PUT_LINE ('X');
END;
/

DECLARE 
    v1 NUMBER;
    zero_divide EXCEPTION;
    PRAGMA EXCEPTION_INIT (zero_divide, -5074);
BEGIN
    v1 := 1 / 0;
EXCEPTION
    WHEN STANDARD.ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE ('X');
END;
/

DECLARE
    e1 EXCEPTION;
BEGIN
    RAISE e1;
    DBMS_OUTPUT.PUT_LINE ('A');
EXCEPTION
    WHEN e1 THEN
        DBMS_OUTPUT.PUT_LINE (SQLERRM);
END;
/

BEGIN
    RAISE_APPLICATION_ERROR (-20001, 'E1');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE (SQLERRM);
END;
/

BEGIN
    BEGIN
        RAISE ZERO_DIVIDE;
    EXCEPTION
        WHEN ZERO_DIVIDE THEN
            DBMS_OUTPUT.PUT_LINE ('X');
    END;
END;
/

BEGIN
    BEGIN
        RAISE ZERO_DIVIDE;
    END;
EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE ('Y');
END;
/

--EXCEPTION EXAMPLE
DROP TABLE t1 PURGE;
CREATE TABLE t1 (c1 NUMBER(1));

BEGIN
    INSERT INTO t1 VALUES (10);
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE (SQLERRM);
END;
/

BEGIN
    FOR i IN 1 .. 10 LOOP
        BEGIN
            INSERT INTO t1 VALUES (i);
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE (i || ': ' || SQLERRM);
        END;
    END LOOP;
END;
/

DROP TABLE t1 PURGE;
DROP TABLE t2 PURGE;

CREATE TABLE t1 AS SELECT ROWNUM AS c1 FROM XMLTABLE('1 to 100000');
CREATE TABLE t2 AS SELECT ROWNUM AS c1, 'X' AS c2 FROM XMLTABLE('1 to 50000');

ALTER TABLE t2 ADD CONSTRAINT t2_pk PRIMARY KEY (c1);

--1
BEGIN
    FOR f1 IN (SELECT * FROM t1) LOOP
        BEGIN
            INSERT INTO t2 (c1, c2) VALUES (f1.c1, 'I');
        EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN
                UPDATE t2 SET c2 = 'U' WHERE c1 = f1.c1;
        END;
    END LOOP;
END;
/

--2
BEGIN
    FOR f1 IN (SELECT * FROM t1) LOOP
        UPDATE t2 SET c2 = 'U' WHERE c1 = f1.c1;
        
        IF SQL%ROWCOUNT = 0 THEN   
            INSERT INTO t2 (c1, c2) VALUES (f1.c1, 'I');
        END IF;
    END LOOP;
END;
/

--3
MERGE
  INTO t2 t
USING t1 s
    ON (t.c1 = s.c1)
  WHEN MATCHED THEN
        UPDATE SET t.c2 = 'U'
  WHEN NOT MATCHED THEN
        INSERT (t.c1, t.c2) VALUES (s.c1, 'I');


DROP TABLE t1 PURGE;
CREATE TABLE t1 (c1 NUMBER(1));

DROP TABLE t_log PURGE;

CREATE TABLE t_log(
    id VARCHAR2(1), bts TIMESTAMP, ets TIMESTAMP, msg VARCHAR2(4000)
  , CONSTRAINT t_log_pk PRIMARY KEY (id, bts)
);

CREATE OR REPLACE PROCEDURE prc_log(
    i_id IN VARCHAR2, i_bts IN TIMESTAMP, i_msg IN VARCHAR2 DEFAULT NULL)
IS
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    MERGE
      INTO t_log
    USING DUAL
        ON (id = i_id AND bts = i_bts)
      WHEN MATCHED THEN
            UPDATE SET ets = SYSTIMESTAMP, msg = i_msg
      WHEN NOT MATCHED THEN
            INSERT (id, bts) VALUES (i_id, i_bts);
    COMMIT;
END;
/

DECLARE
    v_id    VARCHAR2(1) := 'A';
    v_bts   TIMESTAMP   := SYSTIMESTAMP;
    v_msg   VARCHAR2(4000);
BEGIN
    prc_log (v_id, v_bts);
    INSERT INTO t1 VALUES (10);
    COMMIT;
    prc_log (v_id, v_bts);
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        v_msg := SQLERRM || CHR (10) || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
        prc_log (v_id, v_bts, v_msg);
END;
/

SELECT * FROM t1;

SELECT * FROM t_log;