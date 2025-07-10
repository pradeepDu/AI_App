from fastapi import FastAPI , WebSocket 
from fastapi.middleware.cors import CORSMiddleware
from pydantic_models.chat_body import ChatBody
from services.search_service import SearchService
from services.sort_source_service import SortSourceService
from services.llm_service import LLMService
import asyncio
app = FastAPI()

# Add CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Allows all origins
    allow_credentials=True,
    allow_methods=["*"],  # Allows all methods
    allow_headers=["*"],  # Allows all headers
)

search_service = SearchService()
sort_source_service =SortSourceService()
llm_service = LLMService()

@app.websocket("/ws/chat")
async def websocket_chat_endpoint(websocket:WebSocket):
    await websocket.accept()
    try:
         await asyncio.sleep(0.1)
         data = await websocket.receive_json()
         query = data.get("query", "")
         search_results=search_service.web_search(query)
         
         sorted_results = sort_source_service.sort_sources(query,search_results)
         await asyncio.sleep(0.1)
         await websocket.send_json({"type": "search_results", "data": sorted_results}) 
         for chunk in llm_service.generate_response(query,sorted_results):
          await asyncio.sleep(0.1)
          await websocket.send_json({"type": "content", "data": chunk})
    except:
        print("Unexpected error occurred")
    finally: 
        await websocket.close() 
if __name__ == "__main__":
    import uvicorn
    uvicorn.run("main:app", host="0.0.0.0", port=8000,reload=True)