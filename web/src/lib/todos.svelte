<script>
  import { onMount } from "svelte";

  const url = "http://localhost:8000/apis/todos";

  async function getTodos() {
    const res = await fetch(url);

    const json = await res.json();

    if (res.ok) {
      console.log(json);
      return json.message;
    } else {
      alert("error");
    }
  }

  let promise = getTodos();
</script>

{#await promise}
  <h1>waiting...</h1>
{:then messages}
  <h1>{messages}</h1>
{/await}
