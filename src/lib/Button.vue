<template>
  <button class="gulu-button" :class="classes" :disabled="disabled">
    <span v-if="loading" class="gulu-loadingIndicator"></span>
    <slot/>
  </button>
</template>

<script lang="ts">
import {computed} from 'vue';

export default {
  name: 'Button',
  props: {
    theme: {
      type: String,
      default: 'button',
    },
    size: {
      type: String,
      default: 'normal'
    },
    level: {
      type: String,
      default: 'normal'
    },
    disabled: {
      type: Boolean,
      default: false
    },
    loading: {
      type: Boolean,
      default: false
    }
  },
  setup(props) {
    const {theme, size, level} = props;
    const classes = computed(() => {
      return {
        [`gulu-theme-${theme}`]: theme,
        [`gulu-size-${size}`]: size,
        [`gulu-level-${level}`]: level
      };
    });
    return {classes};
  }
};
</script>

<style lang="scss">
$h: 32px;
$border-color: rgb(217, 217, 217);
$color: rgb(38, 38, 38);
$red: rgb(255, 77, 79);
$blue: rgb(24, 144, 255);
$radius: 4px;
.gulu-button {
  box-sizing: border-box;
  height: $h;
  padding: 0 12px;
  cursor: pointer;
  display: inline-flex;
  justify-content: center;
  align-items: center;
  white-space: nowrap;
  background: white;
  color: $color;
  border: 1px solid $border-color;
  border-radius: $radius;
  box-shadow: 0 1px 0 fade-out(black, 0.95);
  transition: ease 0.2s;

  & + & {
    margin-left: 8px;
  }

  &:hover,
  &:focus {
    color: $blue;
    border-color: $blue;
    transition: ease-out 0.2s;
  }

  &:focus {
    outline: none
  }

  &::-moz-focus-inner {
    border: 0;
  }

  &.gulu-theme-link {
    border-color: transparent;
    box-shadow: none;
    color: $blue;

    &:hover, &:focus {
      color: lighten($blue, 10%)
    }
  }

  &.gulu-theme-text {
    border-color: transparent;
    box-shadow: none;
    color: inherit;

    &:hover, &:focus {
      background: darken(white, 5%);
    }
  }

  &.gulu-size-big {
    font-size: 24px;
    height: 48px;
    padding: 0 26px;
  }
;

  &.gulu-size-small {
    font-size: 12px;
    height: 20px;
    padding: 0 8px;
  }

  &.gulu-theme-button {
    &.gulu-level-main {
      background: $blue;
      color: white;
      border-color: $blue;

      &:focus, &:hover {
        background: lighten($blue, 10%);
        border-color: lighten($blue, 10%);
      }
    }

    &.gulu-level-danger {
      background: $red;
      border-color: $red;
      color: white;

      &:focus, &:hover {
        background: lighten($red, 10%);
        border-color: lighten($red, 10%);
      }
    }
  }

  &.gulu-theme-link {
    &.gulu-level-main {
      border-color: $blue;

      &:focus, &:hover {
        color: white;
        background: lighten($blue, 10%);
        border-color: lighten($blue, 10%);
      }
    }

    &.gulu-level-danger {
      color: $red;

      &:focus, &:hover {
        color: lighten($red, 10%);
        border-color: lighten($red, 10%);
      }
    }
  }

  &.gulu-theme-text {
    &.gulu-level-main {
      border-color: darken(white, 20%);

      &:focus, &:hover {
        background: darken(white, 5%);
        border-color: darken(white, 5%);
      }
    }

    &.gulu-level-danger {
      color: $red;
      border-color: darken($red, 20%);

      &:focus, &:hover {
        color: lighten($red, 10%);
        border-color: lighten($red, 10%);
      }
    }
  }

  &.gulu-theme-button {
    &[disabled] {
      border-color: rgb(184, 184, 184);
      cursor: not-allowed;
      color: rgb(184, 184, 184);
      background: rgb(245, 245, 245);
    }
  }

  &.gulu-theme-link, &.gulu-theme-text {
    &[disabled] {
      cursor: not-allowed;
      color: rgb(184, 184, 184);
    }

    &:hover, &:focus {
      background: white;
    }
  }

  > .gulu-loadingIndicator {
    width: 14px;
    height: 14px;
    display: inline-block;
    margin-right: 4px;
    border-radius: 8px;
    border-color: $blue $blue transparent transparent;
    border-style: solid;
    border-width: 2px;
    animation: gulu-spin 1s infinite linear;
  }
}

@keyframes gulu-spin {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}

</style>