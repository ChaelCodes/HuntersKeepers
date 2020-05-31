<template>
  <section id="hunter-ratings">
    <b-collapse
      v-for="(rating_attrs, rating) in ratings"
      class="card"
      :open.sync="rating_attrs.isOpen"
      :key="rating"
    >
      <div slot="trigger" slot-scope="props" class="card-header" role="button">
        <p class="card-header-title">{{rating.toUpperCase() + ': ' + rating_attrs.value}}</p>
        <div class="card-header-title" v-for="move in rating_attrs.moves.slice(0, 3)">
          <hunter-roll-move
            v-show="!rating_attrs.isOpen"
            :hunter_id="hunter_id"
            :move_id="move.id"
            :buttonText="move.name"
          />
        </div>
        <a class="card-header-icon">
          <b-icon :icon="rating_attrs.isOpen ? 'menu-down' : 'menu-up'"></b-icon>
        </a>
      </div>
      <div class="card-content">
        <div class="content">
          <div v-for="move in rating_attrs.moves">
            <div class="level">
              {{move.name}}
              <hunter-roll-move :hunter_id="hunter_id" :move_id="move.id" />
            </div>
            <p>{{move.description}}</p>
            <br />
          </div>
        </div>
      </div>
    </b-collapse>
  </section>
</template>

<script>
import HunterRollMove from "./hunter_roll_move.vue";

export default {
  components: { HunterRollMove },
  data: function() {
    return {
      ratings: {
        charm: {
          isOpen: false,
          moves: [],
          value: 0
        },
        cool: {
          isOpen: false,
          moves: [],
          value: 0
        },
        sharp: {
          isOpen: false,
          moves: [],
          value: 0
        },
        tough: {
          isOpen: false,
          moves: [],
          value: 0
        },
        weird: {
          isOpen: false,
          moves: [],
          value: 0
        }
      }
    };
  },
  methods: {
    roll(move) {
      fetch(`/moves/${move.id}.json?hunter_id=${this.hunter_id}`)
        .then(response => response.json())
        .then(move_resp => {
          this.$buefy.dialog.confirm({
            title: move.name,
            message: move_resp["results"],
            confirmText: "Ok",
            cancelText: "Use Luck",
            onCancel: this.useLuck(move)
          });
        });
    },
    useLuck(move) {
      // query for move result - move
      // remove one luck - hunter
      // display modal
    }
  },
  mounted: function() {
    fetch(`/hunters/${this.hunter_id}.json`)
      .then(response => response.json())
      .then(hunter => {
        Object.keys(this.ratings).forEach(rating => {
          this.ratings[rating].value = hunter[rating];
        });
      });
    fetch(`/moves.json?basic=true`)
      .then(response => response.json())
      .then(moves => {
        moves.forEach(move => {
          this.ratings[move.rating]["moves"].push(move);
        });
      });
  },
  name: "HunterRatings",
  props: ["hunter_id"]
};
</script>
