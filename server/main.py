from fastapi import FastAPI
from pydantic_models.chat_body import ChatBody
from services.search_service import SearchService
from services.sort_source_service import SortSourceService

app = FastAPI()
search_service = SearchService()
sort_source_service =SortSourceService()
@app.post("/chat")
def chat_endpoint(body: ChatBody):
    search_results=search_service.web_search(query=body.query)
    
    sorted_results = sort_source_service.sort_sources(body.query,search_results)
    print(sorted_results)
    return body.query
if __name__ == "__main__":
    import uvicorn
    uvicorn.run("main:app", host="localhost", port=8000,reload=True)