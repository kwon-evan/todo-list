from fastapi import APIRouter

from src.apis.todos import router as todosRouter

apis = APIRouter()
apis.include_router(todosRouter)

__all__ = ["apis"]
