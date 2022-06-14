<script lang="ts">
import { onMount } from "svelte";


  let messages = [
    {
      title: "IT is Open",
      body: "",
      bg: "bg-green-700",
    },
    {
      title: "IT is Closed",
      body: "Check back later",
      bg: "bg-red-700",
    },
  ];
  let selected = messages[0];
  let timer: any;
  let timeLeft:number = 0;

  onMount(async () => {

  });

  function addTime(length:number) {
    clearInterval(timer)
    timeLeft += length
    timer = setInterval(() => {
      timeLeft -= 1
      if (timeLeft <= 0) {
        clearInterval(timer)
      }
    }, 1000)
  }

  function stopTimer() {
    clearInterval(timer)
    timeLeft = 0
  }

  function convertToTime(time:number) {
    return `${Math.floor(time/60)}:${String(time % 60).padStart(2, '0')}`
  }
</script>

<div class="flex flex-row gap-5">
  <button on:click={() => selected = messages[0]}>Open</button>
  <button on:click={() => selected = messages[1]}>Close</button>
  <button on:click={() => addTime(600)}>+Time</button>
  <button on:click={() => stopTimer()}>ClearTime</button>
</div>
<main class="{selected.bg} text-white flex flex-col justify-center items-center text-center">
  <div class="flex-col justify-center items-center">
    <h1 class="text-5xl mb-6">{selected.title}</h1>
    <div class="text-2xl">{selected.body}</div>
    {#if timeLeft > 0}
      <div class="text-7xl">{convertToTime(timeLeft)}</div>
    {/if}
  </div>
</main>

<style>
  main {
    height: 100vh;
  }
</style>
