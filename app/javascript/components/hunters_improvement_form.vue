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
    <b-field v-if="this.options.length > 0" label="Options" v-bind:message="optionDescription">
      <b-select v-model="selectedOption" placeholder="Select Option" name="hunters_improvement[improvable]">
        <option
          v-for="option in options"
          :value="stringifyValue(option)"
          :key="optionKey(option)">
            {{ displayOption(option) }}
        </option>
      </b-select>
    </b-field>
  </section>
</template>

<script>
export default {
  computed: {
    optionDescription: function () {
      if (!this.selectedOption) {
        return '';
      }
      let option = JSON.parse(this.selectedOption);
      return option.description;
    },
  },
  data: function () {
    return {
      improvement: {},
      selectedOption: '',
      options: []
    }
  },
  methods: {
    displayOption(option) {
      return option.name ? option.name : option;
    },
    optionKey(option) {
      return option.id ? option.id : option;
    },
    selectImprovement(improvement) {
      fetch(`/improvements/${this.improvement}.json?hunter_id=${this.hunter_id}`)
        .then(response => response.json())
        .then((improvement) => {
          this.options = improvement['improvable_options'];
          if (this.options) {
            this.selectedOption = this.stringifyValue(this.options[0]);
          }
        });
    },
    stringifyValue(option) {
      if (option) {
        if (option.id) {
          return JSON.stringify(option);
        } else {
          return JSON.stringify({ 'improvable': option });
        }
      }
    },
  },
  props: ['hunter_id', 'improvements']
}
</script>
