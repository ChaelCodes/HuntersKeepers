<template>
  <div>
    <ul>
      <li v-for="move in moves">
        <input type="checkbox" :id="move.id" :value="move" :checked="move.has_move" v-model="checkedMoves">
        <strong>{{move.name}}:</strong> {{move.description}}
      </li>
    </ul>
    <b-button @click="submitMoves">Submit Moves</b-button>
  </div>
</template>

<script>
import Rails from "@rails/ujs"

export default {
  data: function () {
    return {
      moves: [],
      checkedMoves: []
    }
  },
  methods: {
    selectedMoves: function() {
      return this.moves.filter((move) => {
        return move.has_move;
      });
    },
    submitMoves() {
      const hunter_params = {
        id: this.hunter_id,
        hunter: { move_ids: this.checkedMoves.map(move => (move.id)) }
      };
      Rails.ajax({
        url: `/hunters/${this.hunter_id}`,
        type: 'PUT',
        beforeSend(xhr, options) {
          xhr.setRequestHeader('Content-Type', 'application/json; charset=UTF-8');
          // Workaround: add options.data late to avoid Content-Type header to already being set in stone
          // https://github.com/rails/rails/blob/master/actionview/app/assets/javascripts/rails-ujs/utils/ajax.coffee#L53
          options.data = JSON.stringify(hunter_params);
          return true;
        }
      });
    }
  },
  mounted: function() {
    fetch(`/moves.json?hunter_id=${this.hunter_id}`)
      .then(response => response.json())
      .then((moves) => {
        this.moves = moves;
        this.checkedMoves = this.selectedMoves();
      });
  },
  props: ['hunter_id'],
}
</script>
