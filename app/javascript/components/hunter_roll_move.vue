<template>
  <b-button @click="roll()" size="is-small" type="is-primary">{{buttonText || 'Roll'}}</b-button>
</template>

<script>
export default {
  props: ["hunter_id", "move_id", "buttonText"],
  methods: {
    roll(lucky = false, loseExp = false) {
      fetch(this.moveUrl(lucky, loseExp))
        .then(response => response.json())
        .then(move_resp => {
          let dialogParams = {
            title: move_resp["name"],
            message: move_resp["results"],
            confirmText: "Ok",
            cancelText: "Use Luck",
            onCancel: () => this.useLuck(move_resp["roll"] <= 6)
          };
          if (move_resp["roll"] >= 10) {
            this.$buefy.dialog.alert(dialogParams);
          } else {
            this.$buefy.dialog.confirm(dialogParams);
          }
        });
    },
    moveUrl(lucky = false, loseExp = false) {
      // TODO: Nice way of adding params
      let moveUrl = `/moves/${this.move_id}/roll.json?hunter_id=${this.hunter_id}`;
      if (lucky) {
        moveUrl += "&lucky=true";
      }
      if (loseExp) {
        moveUrl += "&lose_experience=true";
      }
      return moveUrl;
    },
    useLuck(loseExp) {
      this.roll(true, loseExp);
    }
  },
  name: "HunterRollMove"
};
</script>
