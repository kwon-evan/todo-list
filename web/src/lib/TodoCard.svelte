<script>
  import * as Card from "$lib/components/ui/card";
  import { Input } from "$lib/components/ui/input";
  import { Button } from "$lib/components/ui/button";
  import { Plus } from "lucide-svelte";

  import TodoItem from "./TodoItem.svelte";
  import { getTodos, createTodo } from "./todo-utils";

  let promise = getTodos();
  let newTodo = "";
  let isLoading = false;
  let error = null;

  async function handleCreateTodo() {
    if (newTodo.trim() !== "" && !isLoading) {
      isLoading = true;
      error = null;
      try {
        await createTodo(newTodo);
        newTodo = "";
        promise = getTodos();
      } catch (err) {
        console.error("Failed to create todo:", err);
        error = "Failed to create todo. Please try again.";
      } finally {
        isLoading = false;
      }
    }
  }

  async function handleKeypress(event) {
    if (event.key === "Enter") {
      await handleCreateTodo();
    }
  }
</script>

<Card.Root class="w-1/3 mx-auto h-1/2 my-10">
  <Card.Header class="items-center">
    <Card.Title tag="h1">Todo List</Card.Title>
  </Card.Header>
  <Card.Content>
    {#await promise}
      <h1>Loading todos...</h1>
    {:then todos}
      {#each todos as todo}
        <TodoItem props={todo} />
      {/each}
    {:catch error}
      <p style="color: red">{error.message}</p>
    {/await}
    {#if error}
      <p style="color: red">{error}</p>
    {/if}
  </Card.Content>
  <Card.Footer class="flex space-x-2 ">
    <Input
      placeholder="Add new todo"
      bind:value={newTodo}
      on:keypress={handleKeypress}
      disabled={isLoading}
    />
    <Button
      size="icon"
      variant="outline"
      on:click={handleCreateTodo}
      disabled={isLoading}
    >
      {#if isLoading}
        Loading...
      {:else}
        <Plus />
      {/if}
    </Button>
  </Card.Footer>
</Card.Root>
