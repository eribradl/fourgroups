<script setup lang="ts">
import { defineProps } from "vue";

const props = defineProps(['isSelected', 'gameWord']);

</script>

<template>
  <div class="card" >
    <div class="card-content">
      <slot>{{ props.gameWord }}</slot>
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
  display: grid;
  /* padding: 20px; */
  font-size: 20px;
  font-weight: 700;
  text-align: center;
  align-items: center;
  height: 100%;
}

@media(max-width: 639px) {
  .card-content {
    font-size: 16px;
  }
}

.selected {
  background-color:  rgb(90, 89, 78);
  color: white;
}
</style>
