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
  const endpoint = url + "/todos/";
  return await axios.post(endpoint, todo).then((res) => res.data);
}

export async function updateTodo(id, todo) {
  const endpoint = url + "/todos/" + id;
  return await axios.put(endpoint, todo).then((res) => res.data);
}

export async function deleteTodo(id) {
  const endpoint = url + "/todos/" + id;
  return await axios.delete(endpoint).then((res) => res.data);
}
