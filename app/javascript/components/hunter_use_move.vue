<template>
  <span>
    <b-button @click="use()" type="is-primary">Use</b-button>
    <datalist id="options">
      <option value="Enchanted Clothing" />
      <option value="Firefox" />
      <option value="Chrome" />
      <option value="Opera" />
      <option value="Safari" />
    </datalist>
  </span>
</template>

<script>
import Rails from "@rails/ujs";
//Todo: populate datalist
export default {
  props: ["hunter_id", "move_id"],
  data: function() {
    return {
      options: {
        "Enchanted Clothing": {
          url: "/hunters/5.json",
          attributes: {
            hunter: {
              gears_attributes: [{ name: "Enchanted Clothing", armor: 1 }]
            }
          }
        }
      }
    };
  },
  methods: {
    use() {
      fetch(`/moves/${this.move_id}.json?hunter_id=${this.hunter_id}`)
        .then(response => response.json())
        .then(move_resp => {
          this.$buefy.dialog.prompt({
            title: move_resp["name"],
            message: move_resp["results"],
            inputAttrs: {
              type: "select",
              list: "options"
            },
            confirmText: "Ok",
            onConfirm: value => this.submit(value)
          });
        });
    },
    submit(value) {
      const params = JSON.stringify(this.options[value]["attributes"]);

      Rails.ajax({
        url: this.options[value]["url"],
        type: "PUT",
        beforeSend(xhr, options) {
          xhr.setRequestHeader(
            "Content-Type",
            "application/json; charset=UTF-8"
          );
          // Workaround: add options.data late to avoid Content-Type header to already being set in stone
          // https://github.com/rails/rails/blob/master/actionview/app/assets/javascripts/rails-ujs/utils/ajax.coffee#L53
          options.data = params;
          return true;
        }
      });
    }
  }
};
</script>
