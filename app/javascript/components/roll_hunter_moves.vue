<template>
  <section id="moves">
    <hunter-move
      v-for="move in moves"
      :key="move.id"
      :hunter="hunter"
      :move="move"
    ></hunter-move>
  </section>
</template>
<script>
import HunterMove from "./hunter_move.vue";

export default {
  components: { HunterMove },
  data: function () {
    return {
      hunter: {},
      moves: [],
    };
  },
  mounted: function () {
    fetch(`/hunters/${this.hunterId}.json`)
      .then((response) => response.json())
      .then((hunter) => {
        this.hunter = hunter;
      });
    fetch(`/moves.json?hunter_id=${this.hunterId}`)
      .then((response) => response.json())
      .then((moves) => {
        this.moves = moves;
      });
  },
  name: "RollHunterMoves",
  props: ["hunterId"],
};
</script>
