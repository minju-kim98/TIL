import os
from typing import List
from openai import OpenAI
from fastapi import FastAPI, File, UploadFile
from pydantic import BaseModel

client = OpenAI(
  api_key=os.environ['OPENAI_API_KEY']
)

def chat(messages):
    res = client.chat.completions.create(model="gpt-3.5-turbo", messages=messages)

    assistant_turn = res.choices[0].message.content
    return assistant_turn

class Turn(BaseModel):
    role: str
    content: str

class Messages(BaseModel):
    messages: List[Turn]

app = FastAPI()

@app.post("/chat")
def post_chat(messages: Messages):
    assistant_turn = chat(messages.messages)
    return assistant_turn

@app.post("/transcribe")
def transcribe_audio(audio_file: UploadFile = File(...)):
    try:
        filename = "tmp_audio_file.wav"
        with open(filename, "wb") as f:
            f.write(audio_file.file.read())

        with open(filename, "rb") as f:
            transcription = client.audio.transcriptions.create(
                model="whisper-1", 
                file=f,
                response_format="text"
            )

        # Access the transcribed text from the top alternative
        text = transcription
    except Exception as e:
        print(e)
        text = f"Failed to transcribe. {e}"

    return {"text": text}