<script setup>
import { defineProps } from "vue";

const props = defineProps(['isSelected'])

</script>

<template>
  <div class="card" >
    <div class="card-content">
      <slot></slot>
    </div>
  </div>
</template>

<style scoped>
.card {
  background-color: rgb(239, 239, 230);
  border-radius: 6px;
  cursor: pointer;
  color: black;
}

.card-content {
  padding: 20px;
  font-size: 20px;
  font-weight: 700;
  text-align: center;
}

.selected {
  background-color:  rgb(90, 89, 78);
  color: white;
}
</style>
