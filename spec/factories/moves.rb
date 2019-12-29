# frozen_string_literal: true

FactoryBot.define do
  factory :move do
    type { Moves::Descriptive }
    playbook
    name { 'I’m Here For A Reason' }
    description do
      'There’s something you are
destined to do. Work out the details with the Keeper,
based on your fate. You cannot die until it comes
to pass. If you die in play, then you must spend a
Luck point. You will then, somehow, recover or be
returned to life. Once your task is done (or you use
up all your Luck), all bets are off.'
    end
  end

  factory :moves_basic, class: Moves::Basic do
    type { Moves::Basic }
    name { 'Act Under Pressure' }
    rating { 1 } # Cool
    six_and_under { 'six and under result ' }
    seven_to_nine { 'seven to nine result' }
    ten_plus { 'ten plus result' }
    twelve_plus { 'advanced moves only' }
  end

  factory :moves_descriptive, class: Moves::Descriptive do
    type { Moves::Descriptive }
    playbook
    name { 'I’m Here For A Reason' }
    description do
      'There’s something you are
destined to do. Work out the details with the Keeper,
based on your fate. You cannot die until it comes
to pass. If you die in play, then you must spend a
Luck point. You will then, somehow, recover or be
returned to life. Once your task is done (or you use
up all your Luck), all bets are off.'
    end
  end

  factory :moves_rollable, class: Moves::Rollable do
    type { Moves::Rollable }
    name { "Destiny's Plaything" }
    description do
      "At the beginning of each
mystery, roll +Weird to see what is revealed about
your immediate future."
    end
    rating { 4 } # Weird
    six_and_under { 'six and under result' }
    seven_to_nine { 'seven to nine result' }
    ten_plus { 'ten plus result' }
    twelve_plus { 'advanced moves only' }
  end
end
