# frozen_string_literal: true

after :playbook do
  @monstrous = Playbook.find_by! name: 'The Monstrous'

  #####
  # Moves
  #####
  [
    {
      name: 'Immortal',
      type: 'Moves::Descriptive',
      playbook_id: @monstrous.id,
      description:'You do not age or sicken, and whenever '\
      'you suffer harm you suffer 1-harm less.'
    },
    {
      name: 'Unnatural Appeal',
      type: 'Moves::Descriptive',
      playbook_id: @monstrous.id,
      description: 'Roll +Weird instead of +Charm when you manipulate someone.'
    },
    {
      name: 'Unholy Strength',
      type: 'Moves::Descriptive',
      playbook_id: @monstrous.id,
      description: 'Roll +Weird instead of +Tough when you kick some ass.'
    },
    {
      name: 'Incorporeal',
      type: 'Moves::Descriptive',
      playbook_id: @monstrous.id,
      description: 'You may move freely through solid objects (but not people).'
    },
    {
      name: 'Preternatural Speed',
      type: 'Moves::Descriptive',
      playbook_id: @monstrous.id,
      description: 'You go much faster than normal people. When you chase, '\
      'flee, or run take +1 ongoing.'
    },
    {
      name: 'Claws of the Beast',
      type: 'Moves::Descriptive',
      playbook_id: @monstrous.id,
      description: 'All your natural attacks get +1 harm.'
    },
    {
      name: 'Mental Dominion',
      type: 'Moves::Rollable',
      playbook_id: @monstrous.id,
      description: 'When you gaze into a normal human’s eyes and exert your '\
      'will over them, roll +Charm. You may spend your hold to give them an '\
      'order. Regular people will follow your order, whatever it is. Hunters '\
      'can choose whether they do it or not. If they do, they mark experience.',
      rating: :charm,
      six_and_under: 'It is clear that you hold no control over them.',
      seven_to_nine: 'Hold 1.',
      ten_plus: 'Hold 3.'
    },
    {
      name: 'Unquenchable Vitality',
      type: 'Moves::Rollable',
      playbook_id: @monstrous.id,
      description: 'When you have taken harm, you can heal yourself. Roll +Cool.',
      rating: :cool,
      six_and_under: 'Your injuries worsen.',
      seven_to_nine: 'Heal 1-harm and stabilise your injuries.',
      ten_plus: 'Heal 2-harm and stabilise your injuries.'
    },
    {
      name: 'Dark Negotiator',
      type: 'Moves::Descriptive',
      playbook_id: @monstrous.id,
      description: 'You can use the manipulate someone move on monsters as '\
      'well as people, if they can reason and talk.'
    },
    {
      name: 'Flight',
      type: 'Moves::Descriptive',
      playbook_id: @monstrous.id,
      description: 'You can fly.'
    },
    {
      name: 'Shapeshifter',
      type: 'Moves::Descriptive',
      playbook_id: @monstrous.id,
      description: 'You may change your form (usually into an animal). Decide '\
      'if you have just one alternate form or several, and detail them. You '\
      'gain +1 to investigate a mystery when using an alternate form’s '\
      'superior senses (e.g. smell for a wolf, sight for an eagle).'
    },
    {
      name: 'Something Borrowed',
      type: 'Moves::Descriptive',
      playbook_id: @monstrous.id,
      description: 'Take a move from a hunter '\
      'playbook that is not currently in play.'
    }
  ].each do |move|
    Move.find_or_create_by!(move)
  end

  #####
  # Improvements
  #####
  [
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
      description: 'Get +1 Sharp, max +2',
      stat_limit: 2,
      rating: :sharp
    },
    {
      type: 'Improvements::RatingBoost',
      description: 'Get +1 Tough, max +2',
      stat_limit: 2,
      rating: :tough
    },
    {
      type: 'Improvements::PlaybookMove',
      description: 'Take another Monstrous move',
      stat_limit: 0
    },
    {
      type: 'Improvements::PlaybookMove',
      description: 'Take another Monstrous move',
      stat_limit: -1
    },    
    {
      type: 'Improvements::HavenMove',
      description: 'Gain a haven, like the Expert has, with two options',
      stat_limit: 0
    },
    {
      description: 'Take a natural attacks pick',
      stat_limit: 0
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
      description: 'Get +1 to any rating, max +3.',
      stat_limit: 3,
      advanced: true
    },
    {
      type: 'Improvements::ChangePlaybook',
      description: 'Change this hunter to a new type.',
      advanced: true
    },
    {
      description: 'Create a second hunter to play as well as this one.',
      advanced: true
    },
    {
      type: 'Improvements::AdvancedMove',
      description: 'Mark two of the basic moves as advanced.',
      advanced: true
    },
    {
      type: 'Improvements::AdvancedMove',
      description: 'Mark another two of the basic moves as advanced.',
      advanced: true
    },
    {
      type: 'Improvements::Retire',
      description: 'Retire this hunter to safety.',
      advanced: true
    },
    {
      type: 'Improvements::AdvancedMove',
      description: 'Free yourself from the curse of your kind. Your curse '\
      'no longer applies, but you lose 1 Weird.',
      advanced: true
    },
    {
      type: 'Improvements::Retire',
      description: 'You turn evil (again). Retire this character, they '\
      'become one of the Keeper’s threats.',
      advanced: true
    },
    {
      type: 'Improvements::GainLuck',
      description: 'Get back one used Luck point.',
      advanced: true
    }
  ].each do |improvement|
    Improvement.find_or_create_by!(playbook: @monstrous, **improvement)
  end

  #####
  # Gear
  #####
  [
    {
      name: '.38 revolver',
      harm: 2,
      tag_list: %w[close reload loud]
    },
    {
      name: '9mm',
      harm: 2,
      tag_list: %w[close loud]
    },
    {
      name: 'Magnum',
      harm: 3,
      tag_list: %w[close reload loud]
    },
    {
      name: 'Shotgun',
      harm: 3,
      tag_list: %w[close messy]
    },
    {
      name: 'Big knife',
      harm: 1,
      tag_list: %w[hand]
    },
    {
      name: 'Brass knuckles',
      harm: 1,
      tag_list: %w[hand quiet small]
    },
    {
      name: 'Sword',
      harm: 2,
      tag_list: %w[hand messy]
    },
    {
      name: 'Huge sword',
      harm: 3,
      tag_list: %w[hand heavy]
    }
  ].each do |gear_attrs|
    gear = Gear.find_or_create_by!(
      name: gear_attrs[:name],
      playbook: @monstrous
    )
    gear.update!(gear_attrs)
  end
end
