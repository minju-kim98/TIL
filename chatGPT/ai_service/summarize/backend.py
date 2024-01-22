from openai import OpenAI
from fastapi import FastAPI
from pydantic import BaseModel

client = OpenAI(
  api_key="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"
)

class SloganGenerator:
    def __init__(self, engine):
        self.engine = engine

    def _infer_using_completion(self, prompt):
        response = client.chat.completions.create(
            model=self.engine,
            messages = [{"role": "assistant", "content": prompt}],
            max_tokens=200,
            n = 1,
            temperature=1.0,
        )
        result = response.choices[0].message.content
        return result
    
    def generate(self, product_name, details, tone_and_manner):
        prompt = f"제품 이름: {product_name}\n주요 내용: {details}\n광고 문구의 스타일: {tone_and_manner}\n한국어로 광고 문구 작성해줘."

        result = self._infer_using_completion(prompt = prompt)

        return result
    

app = FastAPI()

class Product(BaseModel):
    product_name: str
    details: str
    tone_and_manner: str

@app.post("/create_ad_slogan")
def create_ad_slogan(product: Product):
    slogan_generator = SloganGenerator("gpt-3.5-turbo")

    ad_slogan = slogan_generator.generate(product_name=product.product_name,
                                          details=product.details,
                                          tone_and_manner=product.tone_and_manner)
    
    return {"ad_slogan": ad_slogan}
