# frozen_string_literal: true

after :playbook do
  @wronged = Playbook.find_by! name: 'The Wronged'

  ######
  # Moves
  # ratings: charm: 0, cool: 1, sharp: 2, tough: 3, weird: 4
  ######
  [{
    name: "I Know My Prey",
    type: 'Moves::Descriptive',
    playbook_id: @wronged.id,
    description: 'You get +1 ongoing when knowingly investigating, pursuing '\
    'or fighting the breed of monster that caused your loss.'
  },
   {
     name: 'Berserk',
     type: 'Moves::Descriptive',
     playbook_id: @wronged.id,
     description: 'No matter how much harm you take, you '\
     'can always keep going until the current fight is over. '\
     'During a fight, the Keeper may not use harm moves '\
     'on you and you cannot die. When the fight ends, all '\
     'harm takes effect as normal'
   },
   {
     name: 'NEVER AGAIN',
     type: 'Moves::Descriptive',
     playbook_id: @wronged.id,
     description: 'In combat, you may choose to '\
     '*protect someone* without rolling, as if you had '\
     'rolled a 10+, but you may not choose to "suffer little '\
     'harm."'
   },
   {
     name: 'What Does Not Kill Me...',
     type: 'Moves::Descriptive',
     playbook_id: @wronged.id,
     description: 'If you have suffered harm '\
     'in a fight, you gain +1 ongoing until the fight is over.'
   },
   {
     name: 'Fervor',
     type: 'Moves::Descriptive',
     playbook_id: @wronged.id,
     description: 'When you *manipulate someone*, roll '\
     '+Tough instead of +Charm.'
   },
   {
     name: 'Safety First',
     type: 'Moves::Descriptive',
     playbook_id: @wronged.id,
     description: 'You have jury-rigged extra protection '\
     'into your gear, giving you +1 armour (maximum '\
     '2-armour).'
   },
   {
     name: 'DIY Surgery',
     rating: :cool,
     ten_plus: 'On a 10+ it’s all good, it counts as normal first aid, '\
     'plus stabilize the injury and heal 1 harm.',
     seven_to_nine: "On a 7-9 it counts as normal first aid, plus one of "\
     "these, your choice:\n"\
     " • Stabilise the injury but the patient takes -1 forward.\n"\
     " • Heal 1-harm and stabilise for now, but it will return as 2-harm and "\
         "become unstable again later.\n"\
     " • Heal 1-harm and stabilise but the patient takes -1 ongoing until "\
         "it’s fixed properly\n",
     six_and_under: "No heroic measures undertaken; no impact on the "\
     "efficacy of your first aid",
     type: 'Moves::Rollable',
     playbook_id: @wronged.id,
     description: "When you do *quick and dirty first aid on someone* "\
     "(including yourself), roll +Cool."
   },
   {
       name: 'Tools Matter',
       type: 'Moves::Descriptive',
       playbook_id: @wronged.id,
       description: "With your signature weapon (see your gear, below), you "\
       "get +1 to *kick some ass*."
   }].each do |move|
    Move.find_or_create_by!(move)
  end

  #####
  # Gear
  #####

  # Note: Signature weapon could also be:
  # Specialist weapons for destroying your foes (e.g.
  # wooden stakes and mallet for vampires, silver dagger
  # for werewolves, etc.).
  # 4-harm against the specific
  # creatures it targets, 1-harm otherwise, and other
  # tags by agreement with the Keeper

  [
    {
      name: 'Sawn-off shotgun',
      harm: 3,
      tag_list: %w[hand/close messy loud reload]
    },
    {
      name: 'Hand cannon',
      harm: 3,
      tag_list: %w[close loud]
    },
    {
      name: 'Fighting knife',
      harm: 2,
      tag_list: %w[hand quiet]
    },
    {
      name: 'Huge sword or huge axe',
      harm: 3,
      tag_list: %w[harm hand messy heavy],
    },
    {
      name: 'Enchanted dagger',
      harm: 2,
      tag_list: %w[harm hand magic]
    },
    {
      name: 'Chainsaw',
      harm: 2,
      tag_list: %w[hand messy unreliable loud heavy]
    },
    {
      name: '.38 resolver',
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
      name: 'Brass knuckles',
      harm: 1,
      tag_list: %w[close hand stealthy]
    },
    {
      name: 'Assault rifle',
      harm: 3,
      tag_list: %w[close area loud reload]
    },
  ].each do |gear_attrs|
    gear = Gear.find_or_create_by!(
        name: gear_attrs[:name],
        playbook: @wronged
    )
    gear.update!(gear_attrs)
  end

  #####
  # Improvements
  #####
  [
    {
      description: 'Get +1 Tough, max +3',
      type: 'Improvements::RatingBoost',
      stat_limit: 3,
      rating: :tough,
      playbook: @wronged
    },
    {
      description: 'Get +1 Cool, max +2',
      type: 'Improvements::RatingBoost',
      stat_limit: 2,
      rating: :cool,
      playbook: @wronged
    },
    {
      description: 'Get +1 Sharp, max +2',
      type: 'Improvements::RatingBoost',
      stat_limit: 2,
      rating: :sharp,
      playbook: @wronged
    },
    {
      description: 'Get +1 Weird, max +2',
      type: 'Improvements::RatingBoost',
      stat_limit: 2,
      rating: :weird,
      playbook: @wronged
    },
    {
      description: 'Take another Wronged move',
      type: 'Improvements::PlaybookMove',
      playbook: @wronged,
      stat_limit: 0
    },
    {
      description: 'Take another Wronged move',
      type: 'Improvements::PlaybookMove',
      playbook: @wronged,
      # Used to differentiate (and initially hide this) from the identical improvement above.
      stat_limit: -1
    },
    {
      description: 'Gain a haven, like the Expert has, with two options',
      playbook: @wronged
    },
    {
      description: 'Add one more option to your haven',
      type: 'Improvements::HavenMove',
      playbook: @wronged
    },
    {
      description: 'Take a move from another playbook',
      type: 'Improvements::AnotherMove',
      playbook: @wronged,
      stat_limit: 0
    },
    {
      description: 'Take a move from another playbook',
      type: 'Improvements::AnotherMove',
      playbook: @wronged,
      # Used to differentiate (and initially hide this) from the identical improvement above.
      stat_limit: -1
    },
    {
      description: 'Get +1 to any rating, max +3.',
      playbook: @wronged,
      type: 'Improvements::RatingBoost',
      stat_limit: 3,
      advanced: true
    },
    {
      description: 'Change this hunter to a new type.',
      playbook: @wronged,
      type: 'Improvements::ChangePlaybook',
      advanced: true
    },
    {
      description: 'Create a second hunter to play as well as this one.',
      playbook: @wronged,
      advanced: true
    },
    {
      description: 'Mark two of the basic moves as advanced.',
      playbook: @wronged,
      type: 'Improvements::AdvancedMove',
      advanced: true
    },
    {
      description: 'Mark another two of the basic moves as advanced',
      playbook: @wronged,
      type: 'Improvements::AdvancedMove',
      advanced: true
    },
    {
      description: 'Retire this hunter to safety.',
      playbook: @wronged,
      type: 'Improvements::Retire',
      advanced: true
    },
    {
      description: 'You track down the specific monster(s) responsible for your loss. The Keeper must make the next
mystery about them',
      playbook: @wronged,
      advanced: true
    },
    {
      description: 'Change the target of your vengeful rage. Pick a new
monster breed: I know my prey now applies to them
instead.',
      playbook: @wronged,
      advanced: true
    },
    {
      description: 'Get back one used Luck point.',
      playbook: @wronged,
      type: 'Improvements::GainLuck',
      advanced: true
    },
  ].each do |improvement|
    Improvement.find_or_create_by!(improvement)
  end
end
