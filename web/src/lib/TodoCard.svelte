<script>
  import * as Card from "$lib/components/ui/card";
  import { Input } from "$lib/components/ui/input";
  import { Button } from "$lib/components/ui/button";
  import { Plus } from "lucide-svelte";

  import TodoItem from "./TodoItem.svelte";
  import { getTodos, createTodo, updateTodo, deleteTodo } from "./todo-utils";

  let todos = [];
  let newTodo = "";
  let selectedTodoId = null;

  $: promise = loadTodos();

  async function loadTodos() {
    todos = await getTodos();
  }

  async function handleCreateTodo() {
    if (newTodo.trim() !== "") {
      await createTodo(newTodo);
      newTodo = "";
      promise = loadTodos();
    }
  }

  async function handleDelete(event) {
    await deleteTodo(event.detail);
    promise = loadTodos();
  }

  async function handleToggle(event) {
    const todo = todos.find((t) => t.id === event.detail);
    await updateTodo(todo.id, todo.value, !todo.done);
    promise = loadTodos();
  }
</script>

<Card.Root class="w-1/3 mx-auto h-1/2 my-10 drop-shadow-xl">
  <Card.Header class="items-center">
    <Card.Title tag="h1">Todo List</Card.Title>
  </Card.Header>
  <Card.Content>
    {#await promise}
      {#each todos as todo (todo.id)}
        <TodoItem
          props={todo}
          on:delete={handleDelete}
          on:toggle={handleToggle}
        />
      {/each}
    {:then}
      {#each todos as todo (todo.id)}
        <TodoItem
          props={todo}
          on:delete={handleDelete}
          on:toggle={handleToggle}
        />
      {/each}
    {:catch error}
      <p style="color: red">{error.message}</p>
    {/await}
  </Card.Content>
  <Card.Footer class="flex space-x-2">
    <Input
      placeholder="Add new todo"
      bind:value={newTodo}
      on:keypress={(e) => e.key === "Enter" && handleCreateTodo()}
    />
    <Button size="icon" variant="outline" on:click={handleCreateTodo}>
      <Plus />
    </Button>
  </Card.Footer>
</Card.Root>
