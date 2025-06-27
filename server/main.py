from fastapi import FastAPI
from pydantic_models.chat_body import ChatBody

app = FastAPI()

@app.post("/chat")
def chat_endpoint(body: ChatBody):
    print(body.query)
    return body.query
if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="localhost", port=8000)