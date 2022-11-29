<demo>
支持 level
</demo>
<template>
  <h2>button</h2>
  <div>
    <Button level="main">主要按键</Button>
    <Button>普通按键</Button>
    <Button level="danger">危险按钮</Button>
  </div>
  <h2>link</h2>
  <div>
    <Button theme="link" level="main">主要链接</Button>
    <Button theme="link">普通链接</Button>
    <Button theme="link" level="danger">危险链接</Button>
  </div>
  <h2>text</h2>
  <div>
    <Button theme="text" level="main">主要文本</Button>
    <Button theme="text">普通文本</Button>
    <Button theme="text" level="danger">危险文本</Button>
  </div>
</template>

<script lang="ts">
import Button from '../lib/Button.vue';

export default {
  components: {Button},

};
</script>
