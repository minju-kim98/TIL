# 파일 쓰기
data = "hello"
with open("test.txt", "w") as fp:
    fp.write(data)

# 파일 읽기
with open("test.txt", "r") as fp:
    print("========== [파일 읽기 결과] ==========")
    print(fp.read())

import requests

# 이미지가 있는 url 주소
url = "https://search1.kakaocdn.net/argon/600x0_65_wr/ImZk3b2X1w8"

# 해당 url로 서버에게 요청
img_response = requests.get(url)

#요청에 성공했다면,
if img_response.status_code == 200:
    #print(img_response.content)

    print("========== [이미지 저장] ==========")
    with open("test.jpg", "wb") as fp:
        fp.write(img_response.content)