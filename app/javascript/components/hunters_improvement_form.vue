<template>
  <section>
    <b-field label="Improvements">
      <b-select @input="selectImprovement(improvement)" v-model="improvement" placeholder="Select an Improvement" name="hunters_improvement[improvement_id]">
        <option
          v-for="improvement in improvements"
          :value="improvement.id"
          :key="improvement.id">
            {{ improvement.description }}
        </option>
      </b-select>
    </b-field>
    <b-field v-if="this.options.length > 0" label="Options">
      <b-select v-model="selectedOptionId" placeholder="Select Option" name="hunters_improvement[improvable_id]">
        <option
          v-for="option in options"
          :value="option.id"
          :key="option.id">
            {{ option.name }}
        </option>
      </b-select>
    </b-field>
    <input type="hidden" name="hunters_improvement[improvable_type]" :value="selectedOption.type">
  </section>
</template>

<script>
export default {
  computed: {
    selectedOption: function() {
      var selected = this.options.find(option => option.id == this.selectedOptionId);
      return selected || {};
    }
  },
  data: function () {
    return {
      improvement: {},
      selectedOptionId: 1,
      options: []
    }
  },
  methods: {
    selectImprovement(improvement) {
      fetch(`/improvements/${this.improvement}.json?hunter_id=${this.hunter_id}`)
        .then(response => response.json())
        .then((improvement) => {
          this.options = improvement['improvable_options'];
        });
    }
  },
  props: ['hunter_id', 'improvements']
}
</script>
