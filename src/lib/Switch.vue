<template>
  <button @click="toggle" class="gulu-switch" :class="{'gulu-checked':value}"><span></span></button>
</template>

<script>

export default {
  name: 'Switch', props: {value: Boolean},
  setup(props, context) {
    const toggle = () => {context.emit('update:value', !props.value);};
    return {toggle};
  }
};
</script>

<style lang="scss">
$h: 22px;
$h2: $h - 4px;
.gulu-switch {
  height: $h;
  width: $h*2;
  border-radius: calc($h/2) ;
  background: rgba(191, 191, 191, 0.8);
  border: none;
  box-shadow: 0 0 0 2px rgba(228, 228, 228, 0.6);
  position: relative;

  &:focus {
    outline: none;
  }

  &:hover {
    box-shadow: none;
    transition: all 0.5s;
  }

  > span {
    position: absolute;
    top: 2px;
    left: 2px;
    height: $h2;
    width: $h2;
    background: white;
    border-radius: calc($h2 / 2);
    transition: left 0.25s;
  }

  &.gulu-checked {
    background: rgb(24, 144, 255);
    box-shadow: 0 0 0 2px rgba(227, 244, 255, 0.5);

    &:hover {
      box-shadow: none;
      transition: all 0.5s;
    }

    > span {
      left: calc(100% - #{$h2} - 2px);
    }
  }

  &:active {
    > span {
      width: $h2 + 4px;
      transition: all 0.2s ease-in-out
    }
  }

  &.gulu-checked:active {
    > span {
      width: $h2 + 4px;
      margin-left: -4px;
      transition: all 0.2s ease-in-out;
    }
  }
}

</style>