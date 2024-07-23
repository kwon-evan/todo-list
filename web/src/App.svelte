<script>
  import "./app.css";
  import * as Card from "$lib/components/ui/card";
</script>

<main>
  <Card.Root class="w-1/3 mx-auto h-1/2 my-10">
    <Card.Header class="items-center">
      <Card.Title tag="h1">Vite + Svelte</Card.Title>
    </Card.Header>
    <Card.Content>
      <p>Card Content</p>
    </Card.Content>
    <Card.Footer>
      <p>Card Footer</p>
    </Card.Footer>
  </Card.Root>
</main>
