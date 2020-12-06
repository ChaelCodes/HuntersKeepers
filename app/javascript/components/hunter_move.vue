<template>
  <b-collapse class="card" :open.sync="isOpen">
    <div slot="trigger" slot-scope="props" class="card-header" role="button">
      <p class="card-header-title">
        <b-button @click.stop="roll()" type="is-text">{{ title }}</b-button>
      </p>
    </div>
    <div class="card-content">
      <div class="content">
        <b-skeleton
          :active="loading"
          size="is-large"
          :animated="true"
          :count="2"
        ></b-skeleton>
        <p v-show="!loading">{{ moveDescription || move.description }}</p>
      </div>
    </div>
    <div class="footer"></div>
  </b-collapse>
</template>
<script>
export default {
  computed: {
    title: function () {
      let title = this.move.name;
      if (this.move.rating) {
        title += ` (${this.move.rating} ${this.hunter[this.move.rating]})`;
      }
      return title;
    },
  },
  data: function () {
    return {
      isOpen: false,
      loading: false,
      moveDescription: "",
    };
  },
  methods: {
    roll(lucky = false, loseExp = false) {
      this.loading = true;
      this.isOpen = true;
      if (this.move.seven_to_nine) {
        fetch(this.moveUrl(lucky, loseExp))
          .then((response) => response.json())
          .then((move_resp) => {
            this.loading = false;
            this.moveDescription = move_resp["results"];
          });
      } else {
        this.loading = false;
        this.moveDescription = this.move.description;
      }
    },
    moveUrl(lucky = false, loseExp = false) {
      // TODO: Nice way of adding params
      let moveUrl = `/moves/${this.move.id}/roll.json?hunter_id=${this.hunter.id}`;
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
    },
  },
  name: "HunterMove",
  props: ["hunter", "move"],
  watch: {
    isOpen: function (val) {
      if (val == false) {
        this.moveDescription = undefined;
      }
    },
  },
};
</script>
