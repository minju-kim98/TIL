import requests
import json

# 이미지 검색
url = "https://dapi.kakao.com/v2/search/image"
headers = {
    "Authorization" : "KakaoAK ${REST_API_KEY}"    #앱 키 입력. ex) KakaoAK 1234
}
data = {
    "query" : "비투비 이민혁" 
}

# 이미지 검색 요청
response = requests.post(url, headers = headers, data = data)
#요청에 실패했다면
if response.status_code != 200:
    print(f'error! because {response.json()}')
else:
    count = 0
    for image_info in response.json()['documents']:
        print(f'[{count}th] image_url =', image_info['image_url'])
        count += 1