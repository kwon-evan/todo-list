<script>
  import { Button } from "$lib/components/ui/button";
  import { Separator } from "$lib/components/ui/separator";
  import { Trash2 } from "lucide-svelte";

  import { createEventDispatcher } from "svelte";

  export let props;
  let { id, value, done } = props;

  const dispatch = createEventDispatcher();

  $: itemClasses = `flex w-full items-center space-x-2 p-2 my-2 rounded-md transition-colors duration-200 hover:bg-accent`;

  function handleDelete(event) {
    event.stopPropagation();
    dispatch("delete", id);
  }

  function handleToggle(event) {
    event.stopPropagation();
    dispatch("toggle", id);
  }
</script>

<button class={itemClasses} on:click={handleToggle} type="button">
  <p class="w-full text-left {done ? 'line-through' : ''}">{value}</p>
  <Button size="icon" variant="outline" on:click={handleDelete}>
    <Trash2 />
  </Button>
</button>
<Separator />
