<script>
  import "./app.css";
  import svelteLogo from "./assets/svelte.svg";
  import viteLogo from "/vite.svg";
  import Counter from "./lib/Counter.svelte";
  import * as Card from "$lib/components/ui/card";
</script>

<main>
  <Card.Root class="w-1/3 mx-auto h-1/2 my-10">
    <Card.Header class="items-center">
      <div style="display: flex; align-items: center; gap: 1rem">
        <a href="https://vitejs.dev" target="_blank" rel="noreferrer">
          <img src={viteLogo} class="logo" alt="Vite Logo" />
        </a>
        <a href="https://svelte.dev" target="_blank" rel="noreferrer">
          <img src={svelteLogo} class="logo svelte" alt="Svelte Logo" />
        </a>
      </div>
      <Card.Title tag="h1">Vite + Svelte</Card.Title>
      <div>
        <Counter></Counter>
      </div>
    </Card.Header>
    <Card.Content>
      <p class="leading-7 [&:not(:first-child)]:mt-6">
        Check out <a
          href="https://github.com/sveltejs/kit#readme"
          target="_blank"
          rel="noreferrer">SvelteKit</a
        >, the official Svelte app framework powered by Vite!
      </p>
    </Card.Content>
    <Card.Footer>
      <p class="[&:not(:first-child)]:mt-6 text-gray-500">
        Click on the Vite and Svelte logos to learn more
      </p>
    </Card.Footer>
  </Card.Root>
</main>
