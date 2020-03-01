<template>
  <div>
    <ul>
      <li v-for="gear in gears">
        <b-checkbox :id="gear.id" :native-value="gear" :checked="gear.has_gear" v-model="checkedGears">
          <strong>{{gear.name}}</strong>
        </b-checkbox>
        <p>{{gear.tag_list.join(', ')}}</p>
      </li>
    </ul>
    <b-button @click="submitGears">Submit Gear</b-button>
  </div>
</template>

<script>
import Rails from "@rails/ujs"

export default {
  data: function () {
    return {
      gears: [],
      checkedGears: []
    }
  },
  methods: {
    selectedGears: function() {
      return this.gears.filter((gear) => {
        return gear.has_gear;
      });
    },
    submitGears() {
      const hunter_params = {
        id: this.hunter_id,
        hunter: { gear_ids: this.checkedGears.map(gear => (gear.id)) }
      };
      Rails.ajax({
        url: `/hunters/${this.hunter_id}`,
        type: 'PUT',
        beforeSend(xhr, options) {
          xhr.setRequestHeader('Content-Type', 'application/json; charset=UTF-8');
          // Workaround: add options.data late to avoid Content-Type header to already being set in stone
          // https://github.com/rails/rails/blob/master/actionview/app/assets/javascripts/rails-ujs/utils/ajax.coffee#L53
          options.data = JSON.stringify(hunter_params);
          return true;
        }
      });
    }
  },
  mounted: function() {
    fetch(`/gears.json?hunter_id=${this.hunter_id}`)
      .then(response => response.json())
      .then((gears) => {
        this.gears = gears;
        this.checkedGears = this.selectedGears();
      });
  },
  props: ['hunter_id'],
}
</script>
