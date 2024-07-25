import axios from "axios";

const url = "http://localhost:8000/apis";

export async function getTodos() {
  const endpoint = url + "/todos/";
  return await axios.get(endpoint).then((res) => res.data);;
}

export async function getTodo(id) {
  const endpoint = url + "/todos/" + id;
  return await axios.get(endpoint).then((res) => res.data);
}

export async function createTodo(todo) {
  if (typeof todo !== 'string' || todo.trim() === '') {
    throw new Error('Todo must be a non-empty string');
  }

  const endpoint = url + "/todos/";
  const payload = {
    "value": todo.trim(),
    "done": false
  };

  try {
    const response = await axios.post(endpoint, payload);
    return response.data;
  } catch (error) {
    throw error;
  }
}

export async function updateTodo(id, todo) {
  const endpoint = url + "/todos/" + id;
  return await axios.put(endpoint, todo).then((res) => res.data);
}

export async function deleteTodo(id) {
  const endpoint = url + "/todos/" + id;
  return await axios.delete(endpoint).then((res) => res.data);
}
