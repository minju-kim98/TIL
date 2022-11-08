# Project 1: 연예인 사진 모으기 프로젝트
## 1.1 학습목표
* 카카오에서 제공하는 이미지 검색 OpenAPI 사용하여 이미지 다운로드
* 일일이 다운받는 것 보다는 크롤링이 쉽지만, 웹 구조를 알아야 하는 부담감이 있기 때문에 OpenAPI 사용.
* 언어 & 환경: 파이썬 3.8.10, Linux Mint 20.1
* 프로젝트 리소스 및 소스코드:    
    * image_download.ipynb: 구현된 소스코드

## 1.2 사전 준비하기
카카오에서 제공하는 이미지 검색 OpenAPI를 사용하려면 다음과 같은 준비가 필요하다.    
1. 카카오 개발자 사이트(https://developers.kakao.com/)에 가입
2. 에플리케이션(이하 앱)을 만들어 앱 키를 발급받는다:
    * 상단 [내 애플리케이션] 버튼 -> 앱 이름과 회사 이름 작성 후 [저장] -> 앱 키 확인
    * 주로 사용할 키는 'REST API 키'.

## 1.3 사전 지식 쌓기
### 1.3.1 파일 읽고 쓰기
```python
# 파일 쓰기
data = "hello"
with open("test.txt", "w") as fp:
    fp.write(data)

# 파일 읽기
with open("test.txt", "r") as fp:
    print("========== [파일 읽기 결과] ==========")
    print(fp.read())
```

### 1.3.2 웹에 있는 이미지 파일을 저장하는 방법
```python
# 이미지가 있는 url 주소
url = "https://search1.kakaocdn.net/argon/600x0_65_wr/ImZk3b2X1w8"

# 해당 url로 서버에게 요청
img_response = requests.get(url)

#요청에 성공했다면,
if img_response.status_code == 200:
    #print(img_response.content)
    # 윗 줄의 주석을 풀면 바이너리 형태로 정보값이 저장되어 있는 것을 알 수 있다.

    print("========== [이미지 저장] ==========")
    with open("test.jpg", "wb") as fp:
        fp.write(img_response.content)
```

### 1.3.1 OpenAPI 문서를 보는 방법
휴대폰에서 사용하는 앱이나 PC를 통해 보는 웹과 같은 하나의 서비스를 제공하기 위해 필요한 구성요소를 간단하게 세 가지로 볼 수 있다.
1. 프론트엔드 (front-end)
2. 백엔드 (back-end)
3. 프론트엔드와 백엔드의 인터페이스 (interface)    

프론트엔드는 화면 구성을 처리하고, 백엔드는 (뒤에서) 화면에 보여줄 정보를 처리한다.   

그리고 프론트엔드가 백엔드에 요청할 때는 특정 규칙에 맞춰 요청한다. 그리고 그에 맞게 동작하는 API (Application Programming Interface)가 있다.     

OpenAPI는 제공처(카카오, 네이버, ETRI 등)에서 백엔드를 만들어놓고, 그 백엔드를 이용하는 방법을 제공한다.    

그래서 OpenAPI 사용자는 백엔드 주소와 사용 규칙만 알면, 백엔드의 자원을 사용할 수 있게 된다. 즉, 우리는 프론트엔드만 개발하면 된다!     

백엔드 사용법은 제공처에서 가이드(문서, 설명서)를 제공하고 있다.    

반드시 설명하고 있는 내용: 요청(request), 응답(respond)    

요청(request)은 어디로, 어떻게 요청해야 하는지 기술되어 있고, 응답(respond)은 어떤 결과가 전달되는지 기술되어 있다.    

다양한 이유로 오류가 날 수 있는데, 응답 코드 중 요청에 대한 상태를 나타내는 오류는 두 가지가 있다.
1. HTTP의 상태 코드(Status Code)
    * HTTP 프로토콜을 사용하면 공통으로 적용되는 응답코드.
2. response 값에 오류 정보를 담은 오류 코드(Error Code)
    * OpenAPI를 제공하는 제공사마다 다름.


## 1.4 구현하기
### Step 1: 카카오 이미지 검색 OpenAPI 호출하기
카카오 이미지 검색 API를 활용하여, 이미지가 있는 URL을 출력해보자.
> 링크: https://developers.kakao.com/docs/latest/ko/daum-search/dev-guide#search-image

카카오 이미지 검색 OpenAPI의 Request와 Response 가이드이다. Request에 필요한 URL과 Parameter을 찾을 수 있다.
```
GET /v2/search/image HTTP/1.1
Host: dapi.kakao.com
Authorization: KakaoAK ${REST_API_KEY}
```
요청이 정상 처리 되었다면, documents 필드 내에 image_url이 있을 것인데, 이 정보를 사용하여 파일로 저장하면 사진을 모을 수 있다.

### Step 2: 이미지 파일 저장하기
1.3.2에서 구현한 코드를 사용하되, 함수로 만들었다.   
```main.py``` 파일의 ```save_image``` 함수이다.

### Step 3: 전체 코드 완성하기
Step 1, Step 2를 합쳐 전체 코드를 완성할 수 있다.

## 1.5 정리
* 카카오 이미지 검색 OpenAPI 사용 방법을 배웠다.
* 이제 쿼리(query)만 바꿔서 다양한 사진을 수집해보자.