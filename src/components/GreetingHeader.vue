<script setup lang="ts">
defineProps<{
  msg: string
}>()
</script>

<template>
  <div class="greetings">
    <h2>
      {{ msg }}
    </h2>
  </div>
</template>

<style scoped>

h2 {
  font-size: 18px;
  font-weight: 500;
  text-align: center;
}

.greetings {
  padding: 20px;
}

</style>
