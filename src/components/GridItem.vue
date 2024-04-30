<script setup lang="ts">
const props = defineProps(['gameWord', 'fontSize']);

</script>

<template>
  <div class="card" >
    <div class="card-content">
      {{ props.gameWord }}
    </div>
  </div>
</template>

<style scoped>
.card {
  background-color: rgb(239, 239, 230);
  border-radius: 6px;
  cursor: pointer;
  color: black;
  aspect-ratio: 1.875;
  overflow: hidden;
}

.card-content {
  display: grid;
  font-family: "Source Sans 3", sans-serif;
  font-weight: 700;
  text-align: center;
  align-items: center;
  height: 100%;
  font-size: v-bind(fontSize);
}

@media(max-width: 639px) {
  .card {
    aspect-ratio: 1;
  }
}

.selected {
  background-color:  rgb(90, 89, 78);
  color: white;
}
</style>
