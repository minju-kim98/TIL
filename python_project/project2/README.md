# Project 2: 나에게 카카오톡 메시지 보내기 프로젝트 
## 2.1 학습목표
* 카카오에서 개발자들을 위해 제공하는 OpenAPI를 활용하여 우체국에서 택배를 보낼 때 카카오톡으로 메시지를 받는 것과 같은 기능 구현.
* 실제 서비스는 상당히 복잡한 과정을 거치지만, 다른 환경을 최대한 배제하고 내 컴퓨터를 서버(localhost)로 이용하여 구현.
* 언어 & 환경: 파이썬 3.8.10, Linux Mint 20.1
* 프로젝트 리소스 및 소스코드:
  * res/kakao_message: 동작 확인을 위한 리소스 파일이 위치한 폴더
  * kakao_message.py: 구현된 소스코드
* 카카오톡 메시지는 다양한 종류를 제공하지만, 여기서는 "나에게 메시지 보내기"와 "텍스트형과 리스트형 메시지 보내기" 두 가지 유형의 메시지만 다룰 예정.

## 2.2 사전 준비하기
### 2.2.1 접근 권한 설정하기
* 카카오 개발자 사이트(https://developers.kakao.com/)에서 앱 선택 -> 동의항목 설정 -> Redirect URI 설정 -> Web 사이트 도메인 설정
  * 동의항목: 프로필 정보(닉네임/프로필사진), 카카오 계정, 카카오톡 메시지 전송
  * Redirect URI: 인증 코드 발급 요청 시 전달될 위치를 의미. ```카카오 로그인```에서 설정.
    * 내 컴퓨터를 서버처럼 사용하므로, Redirect URI를 https://localhost.com 으로 설정.
  * Web 사이트 도메인 설정
    * 전송할 카카오 메시지에 버튼이 있는데, 메시지를 받고, 그 버튼을 누르면 www.naver.com 으로 이동하려고 함. 이를 위해 ```플랫폼``` 메뉴에 Web 사이트 도메인을 등록.
    * https://www.naver.com , https://localhost.com 두 가지 등록.

### 2.2.2 카카오톡 메시지 API 사용 권한받기(인증 코드와 사용자 토큰 발급)
* 인증 코드 발급받기(인증 코드 받기)   
  developers.kakao.com/docs/latest/ko/kakaologin/rest-api#request-code
* 사용자 토큰 발급받기(사용자 토큰 받기)   
  developers.kakao.com/docs/latese/ko/kakaologin/rest-api#request-token


### 2.2.3 token 관리하기


## 2.3 사전 지식 쌓기


## 2.4 구현하기


## 2.5 정리


## 2.6 Trouble Shooting


## 2.7 보충자료

