from config import Settings
from tavily import TavilyClient
import trafilatura
import logging

logger = logging.getLogger(__name__)

settings = Settings()
tavily_client = TavilyClient(api_key=settings.TAVILY_API_KEY)

class SearchService:
    def web_search(self, query: str):
        results = []
        try:
            logger.info(f"Searching for: {query}")
            response = tavily_client.search(query, max_results=7)
            search_results = response.get("results", [])
            logger.info(f"Found {len(search_results)} raw results")

            for result in search_results:
                try:
                    url = result.get("url")
                    logger.info(f"Fetching content from: {url}")
                    downloaded = trafilatura.fetch_url(url)
                    content = trafilatura.extract(downloaded, include_comments=False)
                    
                    if content:
                        results.append({
                            "title": result.get("title"),
                            "url": url,
                            "content": content
                        })
                except Exception as e:
                    logger.error(f"Error processing result {url}: {str(e)}")
                    continue

            logger.info(f"Processed {len(results)} results successfully")
            return results

        except Exception as e:
            logger.error(f"Search error: {str(e)}")
            return []
