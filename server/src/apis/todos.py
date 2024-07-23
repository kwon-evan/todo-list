from pydantic import BaseModel
from fastapi import APIRouter
from src.prisma import prisma

router = APIRouter()


class TodoCreate(BaseModel):
    value: str
    done: bool


class Todo(BaseModel):
    id: int
    value: str
    done: bool


@router.get("/")
def health_check():
    return {"status": "OK"}


@router.get("/todos/", tags=["todos"])
async def read_todos():
    todos = await prisma.todo.find_many()
    print(todos)
    return {"messeage": todos}


@router.post("/todos/", tags=["todos"])
async def create_todo(todo: TodoCreate):
    todo = await prisma.todo.create(todo.model_dump())
    return todo


@router.put("/todos/{id}", tags=["todos"])
async def update_todo(id: int, todo: TodoCreate):
    todo = await prisma.todo.update(where={"id": id}, data=todo.model_dump())
    return todo


@router.delete("/todos/{id}", tags=["todos"])
async def delete_todo(id: int):
    todo = await prisma.todo.delete(where={"id": id})
    return todo
