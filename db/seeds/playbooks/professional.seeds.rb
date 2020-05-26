# frozen_string_literal: true

after :playbook do
  @professional = Playbook.find_by! name: 'The Professional'

  ######
  # Moves
  # ratings: charm: 0, cool: 1, sharp: 2, tough: 3, weird: 4
  ######
  [
    {
      name: 'The Big Entrance',
      rating: :cool,
      six_and_under: '',
      seven_to_nine: '',
      ten_plus: '',
      type: 'Moves::Rollable',
      playbook_id: @professional.id,
      description: ''
    },
    {
      name: 'Bottle It Up',
      type: 'Moves::Descriptive',
      playbook_id: @professional.id,
      description: 'If you want, you can take up to +3
      bonus when you act under pressure. For each +1
      you use, the Keeper holds 1. That hold can be spent
      later—one for one—to give you -1 on any move
      except act under pressure.'
    },
    {
      name: 'Unfazeable',
      type: 'Moves::Descriptive',
      playbook_id: @professional.id,
      description: 'Take +1 Cool (max +3).'
    },
    {
      name: 'Battlefield Awareness',
      type: 'Moves::Descriptive',
      playbook_id: @professional.id,
      description: 'You always know what’s
      happening around you, and what to watch out for.
      Take +1 armour (max 2-armour) on top of whatever
      you get from your gear.'
    },
    {
      name: 'Leave No One Behind',
      rating: :sharp,
      six_and_under: 'On a miss, you fail to
      get them out and you’ve attracted hostile attention.',
      seven_to_nine: 'You can either get them out
      or suffer no harm, you choose.',
      ten_plus: 'You get
      them out clean.',
      type: 'Moves::Rollable',
      playbook_id: @professional.id,
      description: 'In combat, when you help
      someone escape, roll +Sharp.'
    },
    {
      name: 'Tactical Genius',
      type: 'Moves::Descriptive',
      playbook_id: @professional.id,
      description: 'When you read a bad situation,
      you may roll +Cool instead of +Sharp.'
    },
    {
      name: 'Medic',
      rating: :cool,
      six_and_under: 'You cause an extra 1 harm.',
      seven_to_nine: 'Choose one: heal 2 harm or stabilize the injury.',
      ten_plus: 'The patient is stabilized and healed of 2
      harm',
      type: 'Moves::Rollable',
      playbook_id: @professional.id,
      description: 'You have a full first aid kit, and the training
      to heal people. When you do first aid, roll +Cool.'
    },
    {
      name: 'Mobility',
      type: 'Moves::Descriptive',
      playbook_id: @professional.id,
      description: 'You have a truck, van, or car built for \      monster hunting. Choose two good things and one
      bad thing about it. \
      Good things: roomy; surveillance gear; fast; \
      stealthy; intimidating; classic; medical kit; sleeping space; toolkit; concealed weapons; anonymous;
      armoured (+1 armour inside); tough; monster cage.
      Bad things: loud; obvious; temperamental; beaten-up; gas-guzzler; uncomfortable; slow; old.'
    },
    {
      name: 'Deal with the Agency',
      rating: :cool,
      six_and_under: 'You screwed
      up: you might be suspended or under investigation,
      or just in the doghouse. You certainly aren’t going to
      get any help until you sort it all out.',
      seven_to_nine: 'Things aren’t so great. You might get chewed out
      by your superiors and there’ll be fallout, but you get
      what you need for the job.',
      ten_plus: ' you’re good—your request for gear or personnel is okayed, or your slip-up goes unnoticed',
      type: 'Moves::Rollable',
      playbook_id: @professional.id,
      description: 'When you deal with the Agency, requesting help or
      gear, or making excuses for a failure, roll +Sharp.'
    }
  ].each do |move|
    Move.find_or_create_by!(move)
  end

  # Improvements
  [
    {
      description: 'Get +1 Cool, max +3',
      type: 'Improvements::RatingBoost',
      stat_limit: 3,
      rating: :cool,
      playbook: @professional
    },
    {
      description: 'Get +1 Charm, max +2',
      type: 'Improvements::RatingBoost',
      stat_limit: 2,
      rating: :charm,
      playbook: @professional
    },
    {
      description: 'Get +1 Sharp, max +2',
      type: 'Improvements::RatingBoost',
      stat_limit: 2,
      rating: :sharp,
      playbook: @professional
    },
    {
      description: 'Get +1 Tough, max +2',
      type: 'Improvements::RatingBoost',
      stat_limit: 2,
      rating: :tough,
      playbook: @professional
    },
    {
      description: 'Take another Professional move',
      type: 'Improvements::PlaybookMove',
      playbook: @professional,
      stat_limit: 0
    },
    {
      description: 'Take another Professional move',
      type: 'Improvements::PlaybookMove',
      playbook: @professional,
      stat_limit: -1
    },
    {
      description: 'Add a resource tag for your Agency or change a red tape flag.',
      playbook: @professional
    },
    {
      description: 'Get command of an Agency team of monster hunters.',
      playbook: @professional
    },
    {
      description: 'Take a move from another playbook',
      type: 'Improvements::AnotherMove',
      playbook: @professional,
      stat_limit: 0
    },
    {
      description: 'Take a move from another playbook',
      type: 'Improvements::AnotherMove',
      playbook: @professional,
      stat_limit: -1
    },
    {
      description: 'Get +1 to any rating, max +3',
      type: 'Improvements::RatingBoost',
      stat_limit: 3,
      playbook: @professional
    },
    {
      description: 'Change this Hunter to a new type.',
      playbook: @professional,
      type: 'Improvements::ChangePlaybook',
      advanced: true
    },
    {
      description: 'Create a second  hunter to play as well as this one.',
      playbook: @professional,
      advanced: true
    },
    {
      description: 'Mark two of the basic moves as advanced',
      playbook: @professional,
      type: 'Improvements::AdvancedMove',
      advanced: true
    },
    {
      description: 'Mark another two of the basic moves as advanced',
      playbook: @professional,
      type: 'Improvements::AdvancedMove',
      advanced: true
    },
    {
      description: 'Retire this Hunter to safety.',
      playbook: @professional,
      advanced: true
    },
    {
      description: 'Get some or all of the other players’ hunters hired
      by your agency. They get the deal with the agency
      move, as well as salary and benefits.',
      playbook: @professional,
      advanced: true
    }
  ].each do |improvement|
    Improvement.find_or_create_by!(improvement)
  end
end
