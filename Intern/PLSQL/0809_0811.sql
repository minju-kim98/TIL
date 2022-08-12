SET SERVEROUTPUT ON

-- partition
-- https://docs.oracle.com/cd/E18283_01/server.112/e16541/part_admin001.htm

/*------------------------------------------------------------*/
-- index
CREATE INDEX [인덱스명] ON [테이블명](컬럼1, 컬럼2, 컬럼3, .......)
SELECT * FROM USER_INDEXES
DROP [인덱스 명]

--automatic indexing
EXEC DBMS_AUTO_INDEX.CONFIGURE('AUTO_INDEX_MODE','IMPLEMENT');
EXEC DBMS_AUTO_INDEX.CONFIGURE('AUTO_INDEX_MODE','REPORT ONLY'); --cannot see index
EXEC DBMS_AUTO_INDEX.CONFIGURE('AUTO_INDEX_MODE','OFF');

/*------------------------------------------------------------*/
-- object type
-- https://docs.oracle.com/cd/B19306_01/appdev.102/b14261/objects.htm


/*------------------------------------------------------------*/
-- record type
-- https://www.oracletutorial.com/plsql-tutorial/plsql-record/
-- https://docs.oracle.com/cd/E11882_01/appdev.112/e25519/composites.htm#LNPLS005

/*------------------------------------------------------------*/
-- collection type
-- https://docs.oracle.com/cd/E11882_01/appdev.112/e25519/composites.htm#LNPLS005
