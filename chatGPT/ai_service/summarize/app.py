import streamlit as st
import requests
import pandas as pd
import os
import io

if 'prev_uploaded_file' not in st.session_state:
    st.session_state['prev_uploaded_file'] = None
    st.session_state['prev_df'] = None

summarize_url = "http://localhost:8000/summarize"

def summarize(text):
    response = requests.post(summarize_url, json={"text": text})
    summary = response.json()["summary"]
    return summary

def summarize_df(df):
    global progress_bar

    total = len(df)
    news_summaries = []
    for i, news_origin in enumerate(df['뉴스 원문']):
        summary = summarize(news_origin)
        news_summaries.append(summary)

        progress_bar.progress(i/total, text="progress")
    df['뉴스 요약'] = news_summaries
    return df

def to_excel(df):
    output = io.BytesIO()
    writer = pd.ExcelWriter(output, engine='xlsxwriter')
    df.to_excel(writer, sheet_name='Sheet1', index=False)
    writer.save()
    processed_data = output.getvalue()
    return processed_data

st.title("요약 서비스")
tab1, tab2 = st.tabs(["실시간", "파일 업로드"])

with tab1:
    input_text = st.text_area("여기에 텍스트를 입력하세요", height=300)
    if st.button("요약"):
        if input_text:
            try:
                summary = summarize(input_text)
                st.success(summary)
            except:
                st.error("요약을 할 수 없습니다.")
        else:
            st.warning("텍스트를 입력하세요")

with tab2:
    upload_file = st.file_uploader("Choose a file")

    if upload_file:
        st.success("업로드 성공!")

        if upload_file == st.session_state['prev_uploaded_file']:
            df = st.session_state['prev_df']
        else:
            progress_bar = st.progress(0, text="progress")

            df = pd.read_excel(upload_file)

            st.dataframe(df)
            new_df = summarize_df(df)
            st.dataframe(new_df)

            st.session_state['prev_uploaded_file'] - upload_file
            st.session_state['prev_df'] = df

    file_base_name = os.path.splitext(os.path.basename(upload_file.name))[0]
    st.download_button(
        label="Download",
        data=to_excel(df),
        file_name=f"{file_base_name}_summarized.xlsx"
    )