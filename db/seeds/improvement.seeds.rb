# frozen_string_literal: true

after :playbook do
  [{
    description: 'Get +1 Charm, max +3',
    type: 'Improvements::RatingBoost',
    stat_limit: 3,
    rating: :charm,
    playbook: @chosen
  },
  {
    description: 'Get +1 Cool, max +3',
    type: 'Improvements::RatingBoost',
    stat_limit: 3,
    rating: :cool,
    playbook: @chosen
  },
  {
    description: 'Get +1 Sharp, max +3',
    type: 'Improvements::RatingBoost',
    stat_limit: 3,
    rating: :sharp,
    playbook: @chosen
  },
  {
    description: 'Get +1 Weird, max +3',
    type: 'Improvements::RatingBoost',
    stat_limit: 3,
    rating: :tough,
    playbook: @chosen
  },
  {
    description: 'Get +1 Tough, max +3',
    type: 'Improvements::RatingBoost',
    stat_limit: 3,
    rating: :weird,
    playbook: @chosen
  },
  {
    description: 'Take another Chosen move',
    type: 'Improvements::PlaybookMove',
    playbook: @chosen,
    rating: :weird
  },
  {
    description: 'Take another Chosen move',
    type: 'Improvements::PlaybookMove',
    playbook: @chosen,
    rating: :cool
  },
  {
    description: 'Take a move from another playbook',
    type: 'Improvements::AnotherMove',
    playbook: @chosen,
    rating: :cool
  },
  {
    description: 'Take a move from another playbook',
    type: 'Improvements::AnotherMove',
    playbook: @chosen,
    rating: :weird
  },
  {
    description: 'Gain an Ally',
    playbook: @chosen
  },
  {
    description: 'Get +1 to any rating, max +3.',
    playbook: @chosen,
    type: 'Improvements::RatingBoost',
    stat_limit: 3,
    advanced: true
  },
  {
    description: 'Get back one used Luck point.',
    playbook: @chosen,
    type: 'Improvements::GainLuck',
    advanced: true
  },
  {
    description: 'Retire this Hunter to safety.',
    playbook: @chosen,
    advanced: true
  },
  {
    description: 'Change this Hunter to a new type.',
    playbook: @chosen,
    type: 'Improvements::ChangePlaybook',
    advanced: true
  }].each do |improvement|
    Improvement.find_or_create_by(improvement)
  end
end
