<template>
  <b-collapse class="card" :open.sync="isOpen">
    <div slot="trigger" slot-scope="props" class="card-header" role="button">
      <p class="card-header-title">
        <a>{{ move.name }}</a>
      </p>
      <a class="card-header-icon">
        <b-icon :icon="props.open ? 'chevron-down' : 'chevron-left'"> </b-icon>
      </a>
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
        <p v-show="usedLuck && !loading">{{ luckEffect }}</p>
      </div>
    </div>
    <div class="card-footer">
      <b-button
        @click.stop="roll()"
        v-show="move.rating"
        class="card-footer-item"
        >Roll {{ title }}</b-button
      >
      <b-button
        @click="useLuck(rollResult <= 6)"
        v-show="rollResult < 10"
        class="card-footer-item"
        >Use Luck</b-button
      >
    </div>
  </b-collapse>
</template>
<script>
export default {
  computed: {
    title: function () {
      let title = "";
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
      luckEffect: "",
      moveDescription: "",
      rollResult: 12,
      usedLuck: false,
    };
  },
  methods: {
    roll(lucky = false, loseExp = false) {
      this.usedLuck = false;
      this.loading = true;
      this.isOpen = true;
      if (this.move.seven_to_nine) {
        fetch(this.moveUrl(lucky, loseExp))
          .then((response) => response.json())
          .then((move_resp) => {
            this.loading = false;
            this.moveDescription = move_resp["results"];
            this.rollResult = move_resp["roll"];
            this.luckEffect = move_resp["luck_effect"];
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
      this.usedLuck = true;
    },
  },
  name: "HunterMove",
  props: ["hunter", "move"],
  watch: {
    isOpen: function (val) {
      if (val == false) {
        this.moveDescription = undefined;
        this.rollResult = 12;
      }
    },
  },
};
</script>
