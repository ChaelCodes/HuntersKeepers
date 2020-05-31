<template>
  <b-button @click="roll()" type="is-primary">Roll</b-button>
</template>

<script>
export default {
  props: ["hunter_id", "move_id"],
  methods: {
    roll() {
      fetch(`/moves/${this.move_id}.json?hunter_id=${this.hunter_id}`)
        .then(response => response.json())
        .then(move_resp => {
          this.$buefy.dialog.alert({
            title: move_resp["name"],
            message: move_resp["results"],
            confirmText: "Ok"
          });
        });
    }
  }
};
</script>
