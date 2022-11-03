import requests
import json

def save_image(image_url, file_name):
    """
    이미지가 있는 image_url을 통해 file_name 파일로 저장하는 함수.
    """
    img_response = requests.get(image_url)
    if img_response.status_code == 200:
        with open(file_name, "wb") as fp:
            fp.write(img_response.content)

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