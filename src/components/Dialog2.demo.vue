<demo>
一键打开 Dialog
</demo>
<template>
  <Button @click="showDialog">show</Button>
</template>

<script>
import {openDialog} from '../lib/openDialog';
import Button from '../lib/Button.vue';
import {h} from 'vue';

export default {
  components: {Button},
  setup() {
    const showDialog = () => {
      openDialog({
        title: h('strong', {}, '标题'),
        content: '你好',
        ok() {
          console.log('ok');
        },
        cancel() {
          console.log('cancel');
        }
      });
    };
    return {showDialog};
  }
};
</script>
