<script>
  export let props;
  let { id, value, done } = props;
</script>

<div>
  {#if done == false}
    <p>{id}. {value}</p>
  {:else}
    <p style="text-decoration: line-through">{id}. {value}</p>
  {/if}
</div>
