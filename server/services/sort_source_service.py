from typing import List, Dict
import numpy as np
from sentence_transformers import SentenceTransformer
import logging

logger = logging.getLogger(__name__)

class SortSourceService:
    def __init__(self):
        self.embedding_model = SentenceTransformer("all-miniLM-L6-v2")
        
    def sort_sources(self, query: str, search_results: List[Dict]) -> List[Dict]:
        try:
            if not search_results:
                logger.warning("No search results to sort")
                return []

            logger.info(f"Sorting {len(search_results)} results")
            similar_docs = []
            query_embedding = self.embedding_model.encode([query])[0]  # Get first element

            for res in search_results:
                try:
                    content = res.get('content', '')
                    if not content:
                        continue
                        
                    res_embedding = self.embedding_model.encode([content])[0]  # Get first element
                    similarity = np.dot(query_embedding, res_embedding) / (
                        np.linalg.norm(query_embedding) * np.linalg.norm(res_embedding)
                    )
                    res['similarity_score'] = float(similarity)

                    if similarity > 0.3:
                        similar_docs.append(res)
                except Exception as e:
                    logger.error(f"Error processing document: {str(e)}")
                    continue

            # Fix: return the sorted list instead of just sorting it
            return sorted(similar_docs, key=lambda x: x['similarity_score'], reverse=True)

        except Exception as e:
            logger.error(f"Sort error: {str(e)}")
            return search_results