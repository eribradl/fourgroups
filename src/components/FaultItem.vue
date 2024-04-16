<script setup>
import { defineProps } from "vue";

const props = defineProps(['isSelected'])

</script>

<template>
  <span class="fault"></span>
</template>

<style scoped>
.fault{
  display: flex;
  background-color: rgb(90, 89, 78);
  width: 16px;
  height: 16px;
  border-radius: 9999px;
  margin: 8px 4px 8px 4px;
}
</style>
