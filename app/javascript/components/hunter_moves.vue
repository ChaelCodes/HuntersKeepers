<template>
  <ul>
    <li v-for="move in moves"><strong>{{move.name}}:</strong> {{move.description}}</li>
  </ul>
</template>

<script>
export default {
  data: function () {
    return {
      moves: []
    }
  },
  mounted: function() {
    fetch(`/moves.json?hunter_id=${this.hunter_id}`)
      .then(response => response.json())
      .then((moves) => this.moves = moves);
  },
  props: ['hunter_id'],
}
</script>
