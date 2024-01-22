from openai import OpenAI
import streamlit as st

client = OpenAI(
  api_key="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"
)

def translate_text(text, src_lang, trg_lang):
    prompt=f"Translate the following {src_lang} text to {trg_lang}: {text}"
    response = client.chat.completions.create(
        model="gpt-3.5-turbo",
        messages = [{"role": "assistant", "content": prompt}],
        max_tokens=200,
        n = 1,
        temperature=1.0,
    )
    translated_text = response.choices[0].message.content
    return translated_text


st.title("번역서비스")
text = st.text_area("번역할 텍스트를 입력하세요.", "")

src_lang = st.selectbox("원본 언어", ["영어", "한국어", "일본어"])
trg_lang = st.selectbox("목표 언어", ["영어", "한국어", "일본어"], index=1)

if st.button("번역"):
    st.success(translate_text(text, src_lang, trg_lang))