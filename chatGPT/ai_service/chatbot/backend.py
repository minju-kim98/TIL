import os
from typing import List
from openai import OpenAI
from fastapi import FastAPI
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