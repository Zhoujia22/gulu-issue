<demo>
支持 disabled
</demo>
<template>
  <div>
    <Button theme="button" disabled>禁用按键</Button>
    <Button theme="link" disabled>禁用链接</Button>
    <Button theme="text" disabled>禁用文本</Button>
  </div>
</template>

<script lang="ts">
import Button from '../lib/Button.vue';

export default {
  components: {Button},

};
</script>