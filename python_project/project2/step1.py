import json
import requests

# 저정된 토큰 정보를 읽어 옴
tokens = load_tokens(KAKAO_TOKEN_FILENAME)

# 텍스트 메시지 url
url = "https://kapi.kakao.com/v2/api/talk/memo/default/send"

# request parameter 설정
headers = {
    "Authorization"
}

# 나에게 카카오톡 메시지 보내기 요청 (text)

# 요청에 실패했다면,