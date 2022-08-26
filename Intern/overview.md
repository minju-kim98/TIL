# 2022년 티맥스 여름 인턴
## Overview


### 전반기(22.07.01 ~ 22.07.31)
* SQL, PL/SQL 교육</br>
이론: 생활코딩 Oracle 강좌, <불친절한 PL/SQL 프로그래밍></br>
실습: 프로그래머스 SQL 고득점 Kit
* go 언어 교육</br>
이론: 노마드 코더 Go 비기너 강의 - Go로 크롤러 만들기
* go 언어로 Interpreter 구현 (클론 코딩)</br>
참고문헌: <밑바닥부터 만드는 인터프리터 in Go>



### 후반기(22.08.01 ~ 22.08.31)
* PL/SQL 교육 </br>
이론: <불친절한 PL/SQL 프로그래밍> </br>
구글링
* Materialized View 구현
* DBMS_UTILITY 패키지의 TABLE_TO_COMMA, COMMA_TO_TABLE 구현
* UTL_SMTP 패키지 구현

</br>

## 후반기 상세 내용
**1주차**
- SQL 기본 교육(DML, DDL, PL/SQL, transaction)
- 다중 session 열어서 transaction 확인
- function, procedure, package spec/body, object type spec/body 생성
- if문, for문, label/goto문 사용
- exception 예시 보고 따라하기
</br>

**2주차**
- Trigger, Job, Audit 이용해서 Materialized View 구현
  - 커서의 이용 방법을 몰라서 job을 수행할 때 서로 다른 두 테이블의 내용을 동시에 업데이트 하는 내용을 구현하지 못했었음.
  - 커서 구글링을 통해 MView table 구현 완성.
- 파티션, 인덱스, 오브젝트 타입, 레코드 타입, 콜렉션 타입 스펙 확인 및 사용
- UTL_SMTP 스터디
    - UTL_SMTP package spec을 확인하고, Tibero에 직접 써보며 body 구현 방법 구상
</br>

**3주차**
- DBMS_UTILITY.TABLE_TO_COMMA 구현
    - 마지막 테이블인지 확인하는 변수를 만들어서 구현하는 것이 아니라, 그냥 다 ','로 이어준 뒤, 마지막 콤마를 빼는 형식으로 구현해서 코드가 더 깔끔해짐.
    - 마지막 콤마를 지울 때, rtrim() 함수를 이용하려 했으나, 마지막 테이블이 null인 경우에 마지막 테이블이 string으로 변환되지 않는 문제점이 있었음. 그래서 그냥 substr() 함수로 마지막 문자만 제거함.
    - 구현 시 파일을 패키지로 만들지 않아서 함수 오버로딩이 불가능했었음.
    - 다시 패키지 형태로 만들어서 함수 오버로딩이 가능하게 만듦.
- UTL_SMTP 패키지 만들기
    - 기존에 있던 PKG_UTL_SMTP.sql을 이용해서 패키지 개발을 위한 틀 잡아놓기
- Test 작성
    - 가장 기본적인 함수만 사용하는 Test
    - Write_raw_Data, EHLO 등 보다 복잡한 함수를 사용하는 Test
    - 위와 같이 여러 상황을 Test하기 위해 시나리오를 짬
</br>

**4주차**
- SMTP 서버 구축
    - 디버깅을 하려니 서버가 없어서 구축하기로 함
    - (more 스토리텔링...?)
- UTL_SMTP의 메인 개발은 현서님께서 맡으셔서, 테스트하면서 나타난 오류 수정, write_raw_data 등 비교적 간단한 함수 개발
    - ex) data 함수. data 함수가 안되었던 가장 큰 이유는 close_data(c)의 위치가 잘못되었고, close_data(c)의 구현 오류로 마지막 '.'가 안보내진 것이였음.
- UTL_SMTP로 메일 보내기
    - tmax 메일은 네트워크에러가 뜨면서 메일 발송이 안되므로, 다른 메일을 사용해서 테스트 진행.
    - 네이버 메일은 html형식으로 보내진 메일 처리가 잘 안되서, 학교 메일을 이용해 테스트 메일을 받음.
    - 디버깅 과정에서, 98개의 메일을 테스트메일로 받음
