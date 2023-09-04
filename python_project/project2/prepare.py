# 사용자 토큰 발급
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


#-------------------------------------------------------------------------
# token 관리하기
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