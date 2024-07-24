<script>
  import { onMount } from "svelte";
  import axios from "axios";
  import TodoItem from "./TodoItem.svelte";
  import { getTodos } from "./todo-utils";
  import * as Card from "$lib/components/ui/card";

  let promise = getTodos();
</script>

<Card.Root class="w-1/3 mx-auto h-1/2 my-10">
  <Card.Header class="items-center">
    <Card.Title tag="h1">Todo List</Card.Title>
  </Card.Header>
  <Card.Content>
    {#await promise}
      <h1>waiting...</h1>
    {:then todos}
      {#each todos as todo}
        <TodoItem props={todo} />
      {/each}
    {:catch error}
      <p style="color: red">{error.message}</p>
    {/await}
  </Card.Content>
  <Card.Footer>
    <p>Footer</p>
  </Card.Footer>
</Card.Root>
