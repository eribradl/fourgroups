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
  height: 66px;
  margin: 8px;
  width: calc(3* 8px + 4* 150px);
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

</style>
