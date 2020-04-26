// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
Rails.start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Rails comes with Turbolinks to make page loads faster
// But it can break with Vue, this plugin stops that
import TurbolinksAdapter from 'vue-turbolinks'
// Our Javascript Framework!
import Vue from 'vue/dist/vue.esm'
// Buefy is a UI Component Library
import Buefy from 'buefy'
import 'buefy/dist/buefy.css'

// Components
import HunterGear from '../components/hunter_gear.vue'
import HunterMoves from '../components/hunter_moves.vue'
import HunterRatings from '../components/hunter_ratings.vue'
import HunterRollMove from '../components/hunter_roll_move.vue'
import HuntersImprovementForm from '../components/hunters_improvement_form.vue'

Vue.use(Buefy, TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '#vue-app',
    components: { HunterGear, HunterMoves, HunterRatings, HunterRollMove, HuntersImprovementForm },
  }).default
})
