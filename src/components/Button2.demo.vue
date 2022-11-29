<demo>
支持 size
</demo>
<template>
  <div>
    <Button size="big">大</Button>
    <Button>中</Button>
    <Button size="small">小</Button>
  </div>
</template>

<script lang="ts">
import Button from '../lib/Button.vue';

export default {
  components: {Button},

};
</script>
