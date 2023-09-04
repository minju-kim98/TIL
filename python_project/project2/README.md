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
* 인증 코드 발급
  * 크롬 시크릿 모드로 발급해야 하므로, 시크릿 모드에 들어간 뒤, 아래 URL을 구성하여 요청
    * https://kauth.kakao.com/oauth/authorize?client_id=<REST_API 앱 키를 입력하세요>&response_type=code&redirect_uri=https://localhost.com
    * 카카오톡 로그인을 한 뒤, 조금 기다리면 "사이트에 연결할 수 없음"이 뜬다.
    * 이 때, 주소창에 ```code=``` 다음에 있는 값을 사용하면 된다. ```access_token```을 발급받을 때 필요하므로, 어디에 적어둬야 한다.
* 사용자 토큰 발급
  * request 시에는 4개의 파라미터가 필수로 들어간다. ```grant_type="authorization_code"```로 고정하고, ```client_id=앱키```를, ```redirect_uri```는 내 컴퓨터가 서버 역할을 하므로 ```localhost.com```으로, ```code=``` 방금 발급 받은 인증 코드로 꾸려서 token을 요청하면 된다.
  * 이번에는 response이다. 토큰 발급이 성공했을 때, 이런 정보를 주겠다는 의미이다. 여기서 중요한 것은 ```access_token```과 ```refresh_token```이다. 그리고 ```expires_in```, ```refresh_token_expires_in```이라는 값도 있는데, 각 토큰의 만료 시간이 있는 것으로 보아 해당 시간 이후부터는 유효하지 않음을 알려주고 있다.
  ``` python
  import requests

  url = "https://kauth.kakao.com/oauth/token"

  data = {
      "grant_type" : "authorization_code",
      "client_id" : "<REST_API 앱 키를 입력하세요>",
      "redirect_uri" : "https://localhost.com",
      "code" : "<발급받은 code를 입력하세요>"
  }

  response = requests.post(url, data=data)

  # 요청에 실패했다면
  if response.status_code != 200:
      print("error! because", response.json())
  else: # 성공했다면
      tokens = response.json()
      print(tokens)
  ```
  * Error code: 'KOE320'이 나타난다면, 위의 인증코드를 다시 발급받아 실행해보자.
* token을 잘 발급받았다면, 이후부터는 인증 코드를 발급받을 필요가 없다. 이제부턴 계속 token을 사용하면 된다. 그래서 token을 관리하는 것이 중요해졌으니, 다음으로 token을 관리하기를 알아보자.


### 2.2.3 token 관리하기
* 해당 token은 계속 사용할 것이므로, 파일에 저장해두면 관리하기 편하다. 이제 아래 함수를 각각 만들고, 토큰 저장 함수를 호출한다.
  * ```kakao_token.json```파일에 저장하는 함수 (해당 파일은 ```res/kakao_message``` 폴더에 저장됨.)
  * 저장된 파일에서 토큰 값을 읽어오는 함수
  * 토큰을 갱신하는 함수
  ```python
  import json
  import requests
  import datetime
  import os

  # 카카오 토큰을 저장할 파일명
  KAKAO_TOKEN_FILENAME = "res/kakao_message/kakao_token.json"

  # 저장하는 함수
  def save_tokens (filename, tokens):
      with open(filename, "w") as fp:
          json.dump(tokens, fp)

  # 읽어오는 함수
  def load_tokens(filename):
      with open(filename) as fp:
          tokens = json.load(fp)
      
      return tokens

  # refresh_token으로 access_token 갱신하는 함수
  def update_tokens(app_key, filename):
      tokens = load_tokens(filename)

      url = "https://kauth.kakao.com/oauth/token"
      data = {
          "grant_type" : "refresh_token",
          "client_id" : app_key,
          "refresh_token" : tokens['refresh_token']
      }
      response = requests.post(url, data=data)

      # 요청에 실패했다면, 
      if response.status_code != 200:
          print(f"Error! Because {response.json()}")
          tokens = None
      else:   # 성공했다면,
          print(response.json())
          # 기존 파일 백업
          now = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
          backup_filename = filename+"."+now
          os.rename(filename, backup_filename)
          # 갱신된 토큰 저장
          tokens['access_token'] = response.json()['access_token']
          save_tokens(filename, tokens)

      return tokens

  # 토큰 저장
  tokens = {
      'access_token': 'Cv-----------------------------------------------------', 
      'token_type': 'bearer', 
      'refresh_token': '_uQ---------------------------------------------------', 
      'expires_in': 21599, 
      'scope': 'account_email profile_image talk_message profile_nickname', 
      'refresh_token_expires_in': 5183999
      }
  save_tokens(KAKAO_TOKEN_FILENAME, tokens)

  # 토큰 업데이트 -> 토큰 저장 필수!
  #KAKAO_APP_KEY = "<REST_API 앱 키를 입력하세요>"
  #tokens = update_tokens(KAKAO_APP_KEY, KAKAO_TOKEN_FILENAME)
  #save_tokens(KAKAO_TOKEN_FILENAME, tokens)
  ```


## 2.3 사전 지식 쌓기
### 2.3.1 메시지 서비스 및 활용할 서비스 확인하기
* 순서: 카카오 개발자 사이트 접속 -> 메시지 -> [문서 보기] -> [카카오톡 메시지] 
 ### 2.3.2 메시지 종류 알아보기
 * 순서: 카카오 개발자 사이트 접속 -> 오른쪽 상단 [문서] 클릭 -> 메시지 [REST API] 클릭 -> 왼쪽 메뉴[메시지 템플릿] 클릭 -> [종류] 클릭
### 2.3.3 텍스트와 리스트 메시지 템플릿 알아보기
* 각 메시지의 종류별로 제공되는 템플릿이 있다.
1. 텍스트 메시지 템플릿(기본 설정)
    1. 텍스트 영역: 최대 200자 표시
    2. 버튼 영역: 최대 두 개 표시, 버튼명 8자 이하 권장
2. 리스트 메시지 템플릿
    1. 헤더 영역
    2. 아이템 리스트 영역: 최대 세 개 표시
    3. 제목/설명 영역: 최대 3줄 표시(제목 2줄, 설명 1줄 표시)
    4. 이미지 영역: 400px X 400px (권장사항)
    5. 버튼 영역: 최대 두 개 표시, 버튼명 8자 이하 권장

## 2.4 구현하기
### STEP 1: 텍스트 메시지 템플릿을 사용하여 카카오톡 메시지 보내기

### STEP 2: 리스트 메시지 템플릿을 사용하여 카카오톡 메시지 보내기


## 2.5 정리


## 2.6 Trouble Shooting


## 2.7 보충자료

