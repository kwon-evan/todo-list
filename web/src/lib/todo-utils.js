import axios from "axios";

// const url = "/apis";

export async function getTodos() {
  const endpoint = "/apis/todos/";
  return await axios.get(endpoint).then((res) => res.data);;
}

export async function getTodo(id) {
  const endpoint = "/apis/todos/" + id;
  return await axios.get(endpoint).then((res) => res.data);
}

export async function createTodo(todo) {
  if (typeof todo !== 'string' || todo.trim() === '') {
    throw new Error('Todo must be a non-empty string');
  }

  const endpoint = "/apis/todos/";
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

export async function updateTodo(id, value, isDone) {
  if (typeof value !== 'string' || value.trim() === '') {
    throw new Error('Todo must be a non-empty string');
  }

  const endpoint = "/apis/todos/" + id;
  const payload = {
    "value": value.trim(),
    "done": isDone
  }

  try {
    const response = await axios.put(endpoint, payload);
    return response.data;
  } catch (error) {
    throw error;
  }
}

export async function deleteTodo(id) {
  const endpoint = "/apis/todos/" + id;
  return await axios.delete(endpoint).then((res) => res.data);
}
