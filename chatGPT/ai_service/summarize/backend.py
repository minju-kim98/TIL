import os
from openai import OpenAI
from fastapi import FastAPI
from pydantic import BaseModel

client = OpenAI(
  api_key=os.environ['OPENAI_API_KEY']
)

def summarize_text(text):
    system_instruction = f"assistant는 user의 input을 bullet point로 3줄 요약해준다. user의 input: {text}"

    messages=[{"role": "assistant", "content": system_instruction}]

    response=client.chat.completions.create(model="gpt-3.5-turbo", messages=messages)
    result = response.choices[0].message.content
    return result

app = FastAPI()

class InputText(BaseModel):
    text: str

@app.post("/summarize")
def summarize(input_text: InputText):
    summary = summarize_text(input_text.text)
    return {"summary": summary}






text = "오늘은 화창한 날씨에 일어났다. 창문을 열어보니 따뜻한 햇살이 내 방을 가득 채우고 있었다. 나는 그 햇살을 받으며, 새로운 하루를 맞이하기로 했다. 아침 식사를 마치고 정원으로 나가봤다. 나의 작은 정원에는 색다른 꽃들이 피어나 있었다. 손으로 흙을 만져보면서 그 향기에 취하며, 식물들의 성장을 지켜보는 것은 나에게 큰 힘이 된다. 자연과 소통하는 시간은 나의 마음을 안정시켜주고, 새로운 에너지를 주는 것 같다. 오늘은 예전 친구들과의 모임이 있었다. 함께 고등학교 시절을 떠올리며 웃고 떠들면서, 오랜 친구들과 함께 있는 시간은 참으로 소중하다. 각자의 이야기를 나누면서, 서로에게 격려와 응원의 말을 나누는 것은 마음이 따뜻해지게 만든다. 오후에는 독서 시간이 돌아왔다. 서재에는 내가 좋아하는 다양한 책들이 가득했다. 한 권의 책을 펼칠 때마다, 그 안에 담긴 이야기에 빠져들어 내면의 세계로 빠져들게 된다. 오늘도 책 속에서 새로운 지식과 경험을 쌓아가는 시간은 나에게 큰 보람이다. 저녁에는 가족들과 함께 맛있는 식사를 즐겼다. 가족과 함께 하는 시간은 언제나 특별하다. 대화하며 웃음소리가 가득한 저녁은 나에게 큰 행복을 선사한다. 가족이 함께하는 이 순간들은 나의 삶에 큰 의미를 부여해준다. 하루가 저물어갈 때, 나는 이 날의 경험을 생각하며 마음 속에 감사함을 느낀다. 작은 일상의 순간들이 모여 삶은 더 풍요로워지고, 나의 하루는 특별함으로 가득 차 있다. 잠이 들기 전에, 내일을 기대하며 나는 만족한 미소를 띄우며 잠에 빠져들 것이다."

