<script setup lang="ts">

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
  display: flex;
  border-radius: 16px;
  margin-bottom: 8px;
  margin-top: 0px;
  width: 100%;
  aspect-ratio: 7.8;
  align-items: center;
  flex-direction: column;
}

.card-content {
  display: flex;
  text-align: center;
  align-items: center;
  height: 100%;
  font-weight: 700;
  color: black;
}

@media(max-width: 639px) {
  .card {
    width: calc(3* 8px + 4* 22.5vw);
    aspect-ratio: 4.174;
  }
}

</style>
