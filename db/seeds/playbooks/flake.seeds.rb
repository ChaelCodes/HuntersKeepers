# frozen_string_literal: true

after :playbook do
  @flake = Playbook.find_by! name: 'The Flake'

  #####
  # Moves
  #####
  [
    {
      name: 'Connect the Dots',
      type: 'Moves::Rollable',
      rating: :sharp,
      description: "At the beginning of each mystery, "\
      "if you look for the wider patterns that current "\
      "events might be part of, roll +Sharp. Spend your hold during the "\
      "mystery to ask the Keeper any one of the following "\
      "questions:\n"\
      " • Is this person connected to current events more than they are saying?\n"\
      " • When and where will the next critical event occur?\n"\
      " • What does the monster want from this person?\n"\
      " • Is this connected to previous mysteries we have investigated?\n"\
      " • How does this mystery connect to the bigger picture?",
      six_and_under: 'On a miss hold 0',
      seven_to_nine: 'On a 7-9 hold 1',
      ten_plus: 'On a 10+ hold 3'
    },
    {
      name: 'Crazy Eyes',
      type: 'Moves::Descriptive',
      description: 'You get +1 Weird (max +3).'
    },
    {
      name: 'See, It All Fits Together',
      type: 'Moves::Descriptive',
      description: 'You can use Sharp instead of Charm when you manipulate someone.'
    },
    {
      name: 'Suspicious Mind',
      type: 'Moves::Descriptive',
      description: 'If someone lies to you, you know it.'
    },
    {
      name: 'Often Overlooked',
      type: 'Moves::Rollable',
      rating: :weird,
      description: 'When you act all crazy to avoid something, roll +Weird.',
      six_and_under: 'On a miss, you draw lots (but not all) of the attention.',
      seven_to_nine: "On a 7-9, pick one:\n"\
      " • unthreatening\n"\
      " • unimportant",
      ten_plus: 'On a 10+ you’re regarded as unthreatening and unimportant.'
    },
    {
      name: 'Contrary',
      type: 'Moves::Descriptive',
      description: 'When you seek out and receive someone’s honest advice on '\
      'the best course of action for '\
      'you and then do something else instead, mark experience. If you do '\
      'exactly the opposite of their advice, you also take +1 ongoing on any '\
      'moves you make pursuing that course.'
    },
    {
      name: 'Net Friends',
      type: 'Moves::Rollable',
      rating: :charm,
      description: 'You know a lot of people on the Internet. When you '\
      'contact a net friend to help you with a mystery, roll +Charm.',
      six_and_under: 'On a miss, you burn some bridges.',
      seven_to_nine: 'On a 7-9, they’re prepared to help, but it’s either '\
      'going to take some time or you’re going to have to do '\
      'part of it yourself.',
      ten_plus: "On a 10+, they’re available and helpful:\n"\
      " • they can fix something\n"\
      " • break a code\n"\
      " • hack a computer\n"\
      " • get you some special information"
    },
    {
      name: 'Sneaky',
      type: 'Moves::Descriptive',
      description: 'When you attack from ambush, or from behind, inflict +2 harm.'
    },
  ].each do |move|
    Move.find_or_create_by!(playbook: @flake, **move)
  end

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
      description: 'Take another Flake move',
      stat_limit: 0
    },
    {
      type: 'Improvements::PlaybookMove',
      description: 'Take another Flake move',
      stat_limit: -1
    },
    {
      description: 'Get a haven, like the Expert has, with two options',
    },
    {
      type: 'Improvements::HavenMove',
      description: 'Gain another option for your haven',
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
    Improvement.find_or_create_by!(playbook: @flake, **improvement)
  end


  #####
  # Gear
  #####

  # Note: All the gear until Big Knife is "Normal weapons (pick one)"
  # and the gear from Throwing knives to the end is "Hidden weapons (pick two)"
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
      name: 'Hunting rifle',
      harm: 2,
      tag_list: %w[far loud]
    },
    {
      name: 'Magnum',
      harm: 3,
      tag_list: %w[close reload loud]
    },
    {
      name: 'Shotgun',
      harm: 3,
      tag_list: %w[close messy loud]
    },
    {
      name: 'Big knife',
      harm: 1,
      tag_list: %w[hand]
    },
    {
      name: 'Throwing knives',
      harm: 1,
      tag_list: %w[close many]
    },
    {
      name: 'Holdout pistol',
      harm: 2,
      tag_list: %w[close loud reload]
    },
    {
      name: 'Garrote',
      harm: 3,
      tag_list: %w[intimate]
    },
    {
      name: 'Watchman’s flashlight',
      harm: 1,
      tag_list: %w[hand]
    },
    {
      name: 'Weighted gloves/brass knuckles',
      harm: 1,
      tag_list: %w[hand]
    },
    {
      name: 'Butterfly knife/folding knife',
      harm: 1,
      tag_list: %w[hand]
    }
  ].each do |gear_attrs|
    gear = Gear.find_or_create_by!(
      name: gear_attrs[:name],
      playbook: @flake
    )
    gear.update!(gear_attrs)
  end
end
