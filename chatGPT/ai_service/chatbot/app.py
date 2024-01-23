import streamlit as st
from streamlit_chat import message
import requests

if "messages" not in st.session_state:
    st.session_state['messages'] = [{"role": "user", "content": "blahblahblah"},
                                    {"role": "assistant", "content": "저는 인공지능 어시스턴트로, OpenAI에서 개발된 GPT-3 모델을 기반으로 동작합니다. 당신이 필요로 하는 다양한 질문을 해주세요."}]

chat_url = "http://localhost:8000/chat"

def chat(text):
    user_turn = {"role": "user", "content": text}
    messages = st.session_state["messages"]
    resp = requests.post(chat_url, json={"messages": messages + [user_turn]})
    assistant_turn = resp.json().to_dict()

    st.session_state['messages'].append(user_turn)
    st.session_state['messages'].append(assistant_turn)
    

st.title("쳇봇 서비스")

input_text = st.text_input("You")
if input_text:
    chat(input_text)

for i, msg_obj in enumerate(st.session_state['messages']):
    msg = msg_obj['content']
    is_user = False
    if i % 2 == 0:
        is_user = True
    
    message(msg, is_user = is_user, key=f"chat_{i}")