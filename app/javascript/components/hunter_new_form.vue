<template>
  <section>
    <b-field label="Playbooks">
      <b-select
        @input="selectPlaybook(playbook_id)"
        v-model="playbook_id"
        placeholder="Select a Playbook"
        name="hunter[playbook_id]"
      >
        <option
          v-for="playbook in playbooks"
          :value="playbook.id"
          :key="playbook.id"
        >{{ playbook.name }}</option>
      </b-select>
    </b-field>
    <b-field label="Rating">
      <b-select
        v-model="rating"
        placeholder="Select a Playbook to see Ratings"
        name="hunter[rating_id]"
      >
        <option
          v-for="rating in ratings"
          :value="rating.id"
          :key="rating.id"
        >{{ displayRating(rating) }}</option>
      </b-select>
    </b-field>
  </section>
</template>

<script>
export default {
  data: function() {
    return {
      playbook_id: undefined,
      rating: undefined,
      ratings: []
    };
  },
  methods: {
    displayRating(rating) {
      return `Charm: ${rating.charm}, Cool: ${rating.cool}, Sharp: ${rating.sharp}, Tough: ${rating.tough}, Weird: ${rating.weird}`;
    },
    selectPlaybook(playbook_id) {
      fetch(`/ratings.json?playbook_id=${playbook_id}`)
        .then(response => response.json())
        .then(ratings => {
          this.ratings = ratings;
        });
    }
  },
  name: "HunterNewForm",
  props: ["playbooks"]
};
</script>
