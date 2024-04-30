<script setup lang="ts">
const props = defineProps(['disableDeselect', 'enableSubmit'])
const emits = defineEmits(['shuffle', 'deselect', 'submit'])

const shuffleClicked = () => emits('shuffle')
const deselectClicked = () => emits('deselect')
const submitClicked = () => emits('submit')
</script>

<template>
  <div>
    <button @click="shuffleClicked()">
      Shuffle
    </button>
    <button @click="deselectClicked()" :disabled="disableDeselect">
      Deselect all
    </button>
    <button @click="submitClicked()" :disabled="!enableSubmit">
      Submit
    </button>
  </div>
</template>

<style scoped>
button {
  display: inline-flex;
  font-family: Arial;
  font-size: 16px;
  font-weight: 600;
  width: fit-content;
  min-width: 5.5em;
  height: 3em;
  text-align: center;
  justify-content: center;
  align-items: center;
  padding: 15px;
  max-width: 80vw;
  border-radius: 32px;
  line-height: 1.5em;
  cursor: pointer;
  border: 1px solid;
  margin-top: 16px;
  margin-left: 8px;
  margin-bottom: 16px;
}
</style>
