<template>
  <section>
    <b-field label="Improvements">
      <b-select
        @input="selectImprovement(improvement)"
        v-model="improvement"
        placeholder="Select an Improvement"
        name="hunters_improvement[improvement_id]"
      >
        <option
          v-for="improvement in improvements"
          :value="improvement.id"
          :key="improvement.id"
        >{{ improvement.description }}</option>
      </b-select>
    </b-field>
    <b-field v-if="options.length > 0" label="Options" v-bind:message="optionDescription">
      <b-dropdown v-model="selectedOptions" :multiple="multiple">
        <button class="button is-primary" type="button" slot="trigger">
          <span>{{ selectedDisplay }}</span>
          <b-icon icon="menu-down"></b-icon>
        </button>
        <b-dropdown-item
          v-for="option in options"
          :value="stringifyValue(option)"
          :key="optionKey(option)"
        >{{ displayOption(option) }}</b-dropdown-item>
      </b-dropdown>
    </b-field>
    <span v-if="multiple">
      <input
        type="hidden"
        v-for="option in selectedOptions"
        name="hunters_improvement[improvable][]"
        :value="option"
      />
    </span>
    <span v-else>
      <input type="hidden" name="hunters_improvement[improvable]" :value="selectedOptions" />
    </span>
  </section>
</template>

<script>
export default {
  computed: {
    multiple: function() {
      return this.optionsCount > 1;
    },
    optionDescription: function() {
      if (!this.selectedOptions) {
        return "";
      }
      if (this.multiple && this.selectedOptions.length > 1) {
        return "";
      } else {
        let option = JSON.parse(this.selectedOptions);
        return option.description;
      }
    },
    selectedDisplay: function() {
      if (!this.selectedOptions) {
        return `Select {this.optionsCount}`;
      }
      if (this.multiple && this.selectedOptions.length > 1) {
        this.selectedNames = this.selectedOptions.map(
          option => JSON.parse(option).name
        );
        return this.selectedNames.join(", ");
      } else {
        let option = JSON.parse(this.selectedOptions);
        return option.name ? option.name : option.improvable;
      }
    }
  },
  data: function() {
    return {
      improvement: {},
      selectedOptions: [],
      options: [],
      optionsCount: 0
    };
  },
  methods: {
    displayOption(option) {
      return option.name ? option.name : option;
    },
    optionKey(option) {
      return option.id ? option.id : option;
    },
    selectImprovement(improvement) {
      fetch(
        `/improvements/${this.improvement}.json?hunter_id=${this.hunter_id}`
      )
        .then(response => response.json())
        .then(improvement => {
          this.options = improvement["improvable_options"];
          this.optionsCount = improvement["options_count"];
          if (this.options) {
            this.selectedOptions = [this.stringifyValue(this.options[0])];
          }
        });
    },
    stringifyValue(option) {
      if (option) {
        if (option.id) {
          return JSON.stringify(option);
        } else {
          return JSON.stringify({ improvable: option });
        }
      }
    }
  },
  props: ["hunter_id", "improvements"]
};
</script>
