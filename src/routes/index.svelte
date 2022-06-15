<script lang="ts">
  import { onMount } from "svelte";

  let messages = [
    {
      title: "ICT is Closed for the day",
      body: "",
      bg: "bg-black",
      onStart: () => {},
      onTimeout: () => {},
      onEnd: () => {},
    },
    {
      title: "ICT is Open",
      body: "",
      bg: "bg-green-700",
      onStart: () => {},
      onTimeout: () => {},
      onEnd: () => {},
    },
    {
      title: "ICT is Closed",
      body: "Check back later",
      bg: "bg-red-700",
      onStart: () => {},
      onTimeout: () => {},
      onEnd: () => {},
    },
    {
      title: "ICT is Closed",
      body: "Check back in:",
      bg: "bg-red-700",
      onStart: () => {addTime(3)},
      onTimeout: () => {changeMessage(4)},
      onEnd: () => {},
    },
    {
      title: "ICT will be back shortly",
      body: "",
      bg: "bg-yellow-600",
      onStart: () => {},
      onTimeout: () => {},
      onEnd: () => {},
    },
  ];
  let selected = messages[1];
  let timer: any;
  let timeLeft: number = 0;

  onMount(async () => {});

  function changeMessage(index:number) {
    stopTimer()
    selected.onEnd();
    selected = messages[index];
    selected.onStart();
  }

  function addTime(length: number) {
    clearInterval(timer);
    timeLeft += length;
    timer = setInterval(() => {
      timeLeft -= 1;
      if (timeLeft <= 0) {
        clearInterval(timer);
        selected.onTimeout();
      }
    }, 1000);
  }

  function stopTimer() {
    clearInterval(timer);
    timeLeft = 0;
  }

  function convertToTime(time: number) {
    return `${Math.floor(time / 60)}:${String(time % 60).padStart(2, "0")}`;
  }

  function onKeyDown(e: KeyboardEvent) {
    let num = e.keyCode - 48;

    if (num >= 0 && num <= 9) {
      if (num < messages.length) {
        changeMessage(num);
      }
      return;
    }

    if (e.key == " ") addTime(600);
    else if (e.key == "Backspace") stopTimer();
  }
</script>

<svelte:window on:keydown={onKeyDown} />

<div class="fixed flex flex-row gap-5 hidden">
  <button on:click={() => (selected = messages[0])}>Open</button>
  <button on:click={() => (selected = messages[1])}>Close</button>
  <button on:click={() => addTime(600)}>+Time</button>
  <button on:click={() => stopTimer()}>ClearTime</button>
</div>
<main
  class="{selected.bg} text-white flex flex-col justify-center items-center text-center"
>
  <div class="flex-col justify-center items-center">
    <h1 class="text-9xl mb-6">{selected.title}</h1>
    <div class="text-4xl">{selected.body}</div>
    {#if timeLeft > 0}
      <div class="text-9xl">{convertToTime(timeLeft)}</div>
    {/if}
  </div>
</main>

<style>
  main {
    height: 100vh;
  }
</style>
