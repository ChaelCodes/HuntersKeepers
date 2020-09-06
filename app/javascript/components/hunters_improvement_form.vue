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

    <b-field
      v-for="key in optionKeys"
      :key="key"
      :label="key"
      v-bind:message="optionDescription(key)"
      style="text-transform:capitalize"
    >
      <div>
        <b-dropdown v-model="selectedOptions[key]" :multiple="multiple(key)">
          <button class="button is-primary" type="button" slot="trigger">
            <span>{{ selectedDisplay(key) }}</span>
            <b-icon icon="menu-down"></b-icon>
          </button>
          <b-dropdown-item
            v-for="option in options[key]['data']"
            :value="option"
            :key="optionKey(option)"
          >{{ displayOption(option) }}</b-dropdown-item>
        </b-dropdown>
        <span class="control">
          <input type="hidden" name="hunters_improvement[improvable]" :value="submittedOptions" />
        </span>
      </div>
    </b-field>
  </section>
</template>

<script>
export default {
  computed: {
    optionKeys: function () {
      return Object.keys(this.options);
    },
    submittedOptions: function () {
      return JSON.stringify(this.selectedOptions);
    },
  },
  data: function () {
    return {
      improvement: {},
      selectedOptions: {},
      options: {},
    };
  },
  methods: {
    displayOption(option) {
      return option.name ? option.name : option;
    },
    optionKey(option) {
      return option.id ? option.id : option;
    },
    optionDescription: function (key) {
      if (!this.selectedOptions[key]) {
        return "";
      }
      return this.selectedOptions[key].description || "";
    },
    multiple: function (key) {
      if (this.options[key]) {
        return this.options[key]["count"] > 1;
      }
    },
    selectedDisplay: function (key) {
      if (!this.selectedOptions[key]) {
        return `Select ${this.options[key]["count"]}`;
      }

      if (this.multiple(key) && this.selectedOptions[key].length > 1) {
        let selectedNames = this.selectedOptions[key].map(
          (option) => option.name
        );
        return selectedNames.join(", ");
      } else {
        return this.selectedOptions[key].name || this.selectedOptions[key];
      }
    },
    selectImprovement(improvement) {
      fetch(
        `/improvements/${this.improvement}.json?hunter_id=${this.hunter_id}`
      )
        .then((response) => response.json())
        .then((improvement) => {
          this.options = improvement["improvable_options"];
        });
    },
  },
  props: ["hunter_id", "improvements"],
};
</script>
