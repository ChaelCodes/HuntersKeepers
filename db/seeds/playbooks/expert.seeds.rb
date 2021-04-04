# frozen_string_literal: true

after :playbook do
  @expert = Playbook.find_by! name: 'The Expert'

  #####
  # Improvements
  #####
  [
    {
      type: 'Improvements::RatingBoost',
      description: 'Get +1 Sharp, max +3',
      stat_limit: 3,
      rating: :sharp
    },
    {
      type: 'Improvements::RatingBoost',
      description: 'Get +1 Charm, max +2',
      stat_limit: 2,
      rating: :charm
    },
    {
      type: 'Improvements::RatingBoost',
      description: 'Get +1 Cool, max +2',
      stat_limit: 2,
      rating: :cool
    },
    {
      type: 'Improvements::RatingBoost',
      description: 'Get +1 Weird, max +2',
      stat_limit: 2,
      rating: :weird
    },
    {
      type: 'Improvements::PlaybookMove',
      description: 'Take another Expert move',
      stat_limit: 0
    },
    {
      type: 'Improvements::PlaybookMove',
      description: 'Take another Expert move',
      stat_limit: -1
    },
    {
      type: 'Improvements::HavenMove',
      description: 'Add an option to your haven',
      stat_limit: 0
    },
    {
      type: 'Improvements::HavenMove',
      description: 'Add an option to your haven',
      stat_limit: -1
    },
    {
      type: 'Improvements::AnotherMove',
      description: 'Take a move from another playbook',
      stat_limit: 0
    },
    {
      type: 'Improvements::AnotherMove',
      description: 'Take a move from another playbook',
      stat_limit: -1
    },

    {
      type: 'Improvements::RatingBoost',
      description: 'Get +1 to any rating, max +3',
      stat_limit: 3,
      advanced: true
    },
    {
      type: 'Improvements::ChangePlaybook',
      description: 'Change this hunter to a new type',
      advanced: true
    },
    {
      description: 'Create a second hunter to play as well as this one',
      advanced: true
    },
    {
      type: 'Improvements::AdvancedMove',
      description: 'Mark two of the basic moves as advanced',
      advanced: true
    },
    {
      type: 'Improvements::AdvancedMove',
      description: 'Mark another two of the basic moves as advanced',
      advanced: true
    },
    {
      type: 'Improvements::Retire',
      description: 'Retire this hunter to safety',
      advanced: true
    },
    {
      type: 'Improvements::GainLuck',
      description: 'Get back one used Luck point',
      advanced: true
    },
  ].each do |improvement|
    Improvement.find_or_create_by!(playbook: @expert, **improvement)
  end
end
