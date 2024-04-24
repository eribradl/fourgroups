<script setup lang="ts">
import { ref } from 'vue'
import ButtonPanel from './ButtonPanel.vue'
import GridItem from './GridItem.vue'
import SolutionGroup from './SolutionGroup.vue'
import FaultItem from './FaultItem.vue'
import localGames from '../games.json'

const shuffledWords = ref([]);
const areAnyWordsSelected = ref(false);
const solvedGroups = ref([]);
const faults = ref(4);
const anyFaultsRemaining = ref(true);
const gameWon = ref(false);

const gameId = 1;

const jsonResponse = localGames;
const allGames = jsonResponse.games;
const targetGame = allGames.find((element: any) => element.id == gameId);
const orderedList = extractWordListFromAnswers(targetGame.answers);
shuffleWordList(orderedList);

function extractWordListFromAnswers(answers: any) {
  const wordList = [];
  for (var answer of answers) {
    for (var word of answer.words) {
      wordList.push(word)
    }
  }

  return wordList;
}

function shuffleWordList(array: any) {
  for (var i = array.length - 1; i > 0; i--) { 
    // Generate random number 
    var j = Math.floor(Math.random() * (i + 1));

    var temp = array[i];
    array[i] = array[j];
    array[j] = temp;
  }

  shuffledWords.value = array;
}

function reshuffleWords() {
  shuffleWordList(shuffledWords.value);
}

function deselectAllWords() {
  selectedWords.value = [];
  readyToSubmit.value = false;
  areAnyWordsSelected.value = false;
}

function getRandomInt(max: number) {
  return Math.floor(Math.random() * max);
}

const selectedWords = ref([]);
const readyToSubmit = ref(false);

function toggleWord(wordBeingToggled) {
  if (selectedWords.value.includes(wordBeingToggled)) {
    selectedWords.value = selectedWords.value.filter(word => word !== wordBeingToggled)
  } else if (selectedWords.value.length < 4 && !selectedWords.value.includes(wordBeingToggled)) {
    selectedWords.value.push(wordBeingToggled);
  }

  if (selectedWords.value.length === 4) {
    readyToSubmit.value = true;
  } else {
    readyToSubmit.value = false;
  }

  if (selectedWords.value.length > 0) {
    areAnyWordsSelected.value = true;
  } else {
    areAnyWordsSelected.value = false;
  }
}

const resultSummary = ref([]);
function checkSelectedWords() {
  let guessEmojis="";
  // find corresponding emojis for each guessWord
  selectedWords.value.forEach(selectedWord => {
    targetGame.answers.forEach(answer => {
      if (answer.words.includes(selectedWord)) {
        guessEmojis = guessEmojis + answer.emoji;
      }
    })
  })
  resultSummary.value.push(guessEmojis);

  let matchFoundOverall = false;
  targetGame.answers.forEach(answer => {
    let matchFound = false;
    const sortedAnswers = answer.words.slice().sort();
    const sortedGuess = selectedWords.value.slice().sort();
    if (!matchFound) {
      for (let i = 0; i < sortedAnswers.length; i++) {
        if (sortedAnswers[i] === sortedGuess[i] && (i === 0 || matchFound)) {
          matchFound = true;
        } else {
          matchFound = false;
        }
      }
    }

    if (matchFound) {
      shuffledWords.value = shuffledWords.value.filter(word => !selectedWords.value.includes(word));
      solvedGroups.value.push(answer);

      if(shuffledWords.value.length === 0) {
        gameWon.value = true;
      }
      //check to see if game has been won
      selectedWords.value = [];
      matchFoundOverall = true;
    }
  })
  if (!matchFoundOverall) {
    faults.value--;
    if (faults.value === 0) {
      anyFaultsRemaining.value = false;
    }
  }
}

</script>

<template>
  <div class = "solutions">
    <SolutionGroup v-for = "(solvedGroup, index) of solvedGroups"
    :key="index"
    :style="{backgroundColor: solvedGroup.color}">
    {{  solvedGroup.description }}
    <br>
    {{  solvedGroup.words.join(', ') }}
    </SolutionGroup>
  </div>
  <div class = "grid">
    <GridItem v-for="(gameWord, index) of shuffledWords" 
    @click="toggleWord(gameWord)" 
    :class="{ 'selected': selectedWords.includes(gameWord)}"
    :key="index" 
    :isSelected="selectedWords.includes(gameWord)"
    :gameWord="gameWord">
    </GridItem>
  </div>
  <div class = "fault">
    Mistakes remaining:
    <FaultItem v-for="(index, i) in faults"
    :key="i">
    </FaultItem>
  </div>
  <ButtonPanel v-if="anyFaultsRemaining && !gameWon"
  @shuffle="reshuffleWords" @deselect="deselectAllWords" @submit="checkSelectedWords" 
  :enableSubmit="readyToSubmit" :disableDeselect="!areAnyWordsSelected"/>
  <div class = "results" v-if="!anyFaultsRemaining || gameWon">
    <p v-if="!anyFaultsRemaining">
      Sorry you lost, please refresh to try a new game
    </p>
    <p v-if="gameWon">
      Hooray you won!
    </p>
    <div v-for="(item, index) in resultSummary" :key="index">
      {{ item }}
    </div>
  </div>
</template>

<style>
  .grid {
    display: grid;
    gap: 8px;
    width: calc(3* 8px + 4* 150px);
    height: calc(3* 8px + 4* 80px);
    bottom: 0;
    grid-template-columns: repeat(4, 1fr);
    min-height: 0;
    min-width: 0;
    margin-bottom: 16px
  }

  .fault {
    display: flex;
    flex-direction: row;
    align-items: center;
  }

  .results {
    text-align: center;
  }

  @media(max-width: 639px) {
  .grid {
    margin-bottom: 20px;
    height: calc(3* 8px + 4* 22.5vw);
    width: calc(3* 8px + 4* 22.5vw);
  }
}

</style>

