<script>
  import { Button } from "$lib/components/ui/button";
  import { Separator } from "$lib/components/ui/separator";
  import { Trash2, SquarePen } from "lucide-svelte";

  export let props;
  let { id, value, done } = props;
</script>

<form>
  <div class="flex w-full items-center space-x-2 pt-4 pb-4">
    <p class="w-full">{id}. {value}</p>
    <Button variant="outline">
      <SquarePen />
    </Button>
    <Button variant="outline">
      <Trash2 />
    </Button>
  </div>
  <Separator />
</form>
