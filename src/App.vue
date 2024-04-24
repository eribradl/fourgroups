<script setup lang="ts">
import GreetingHeader from './components/GreetingHeader.vue'
import GameBoard from './components/GameBoard.vue'
</script>

<template>
  <header>
    <GreetingHeader msg="Create four groups of four!" />
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
  width: 100vw;
}

</style>
