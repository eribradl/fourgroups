<script setup lang="ts">
import GreetingHeader from './components/GreetingHeader.vue'
import GameBoard from './components/GameBoard.vue'
</script>

<template>
  <header>
    <div class="wrapper">
      <GreetingHeader msg="Ms. Hubley's Science Connections" />
    </div>
  </header>

  <main>
    <Suspense>
      <GameBoard/>
    </Suspense>
  </main>
</template>

<style scoped>
header {
  line-height: 1.5;
}

main {
  display: flex;
  flex-direction: column;
  align-items: center;
}
</style>
