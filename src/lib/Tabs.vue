<template>
  <div class="gulu-tabs">
    <div class="gulu-tabs-nav" ref="container">
      <div class="gulu-tabs-nav-item" :class="{selected:t===selected}" @click="select(t)" v-for="(t,index) in titles"
           :key="index" :ref="el=>{if(t===selected) selectedItem=el}">{{ t }}
      </div>
      <div class="gulu-tabs-nav-indicator" ref="indicator"></div>
    </div>
    <div class="gulu-tabs-content">
      <component class="gulu-tabs-content-item" :is="current" :key="current.props.title"/>
    </div>
  </div>

</template>

<script lang="ts">

import Tab from './Tab.vue';
import {computed, onMounted, ref, watchEffect} from 'vue';

export default {
  name: 'Tabs',
  props: {
    selected: {
      type: String
    }
  },
  setup(props, context) {
    const selectedItem = ref<HTMLDivElement>(null);
    const indicator = ref<HTMLDivElement>(null);
    const container = ref<HTMLDivElement>(null);
    onMounted(() => {
      watchEffect(() => {
        const {width} = selectedItem.value.getBoundingClientRect();
        indicator.value.style.width = width + 'px';
        const {left: left1} = container.value.getBoundingClientRect();
        const {left: left2} = selectedItem.value.getBoundingClientRect();
        const left = left2 - left1;
        indicator.value.style.left = left + 'px';
      });
    });
    const defaults = context.slots.default();
    defaults.forEach((tag) => {
      if (tag.type !== Tab) {
        throw new Error('Tabs 的子标签必须是 Tab');
      }
    });
    const titles = defaults.map((tag) => {
          return tag.props.title;
        }
    );
    const current = computed(() => {
      return defaults.find(tag => tag.props.title === props.selected);
    });
    const select = (tag) => {
      context.emit('update:selected', tag);
    };
    return {defaults, titles, select, indicator, container, selectedItem, current};
  }
};
</script>

<style lang="scss">
$blue: #1890ff;
$color: #262626;
$border-color: #f0f0f0;
.gulu-tabs {
  &-nav {
    display: flex;
    color: $color;
    border-bottom: 1px solid $border-color;
    position: relative;

    &-item {
      padding: 8px 0;
      margin: 0 16px;
      cursor: pointer;

      &:first-child {
        margin-left: 0;
      }

      &.selected {
        color: $blue;
      }
    }

    &-indicator {
      position: absolute;
      height: 3px;
      background: $blue;
      left: 0;
      bottom: -1px;
      width: 100px;
      transition: all 0.25s;
    }
  }

  &-content {
    padding: 8px 0;
    }
  }
</style>