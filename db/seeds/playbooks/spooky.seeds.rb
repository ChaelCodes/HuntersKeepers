# frozen_string_literal: true

after :playbook do
    @spooky = Playbook.find_by! name: 'The Spooky'
  
    ######
    # Moves
    # ratings: charm: 0, cool: 1, sharp: 2, tough: 3, weird: 4
    ######
    [{
      name: 'Telepathy',
      playbook_id: @spooky.id,
      description: 'You can read people’s thoughts and put words 
      in their mind. This can allow you to investigate a mystery 
      or read a bad situation without needing to actually talk. 
      You an also manipulate someone without speaking. You still 
      roll moves as normal, except people will not expect the 
      weirdness of your mental communication.'
    }
     {
       name: 'Hex',
       type: 'Moves::Descriptive',
       playbook_id: @spooky.id,
       description: 'When you cast a spell (with use magic), as
       well as the normal effects, you may pick from the following:
       \n • The target contracts a disease.
       \n • The target immediatly suffers harm (-2 harm magic ignore-armor
       \n • The target breaks something precious or important'
    },
    {
      name: 'The Sight',
      type: 'Moves::Descriptive',
      playbook_id: @spooky.id,
      description:'You can see the invisible, especially spirits and magical 
      influences. You may communicate with (maybe even make deals with) the 
      spirits you see, and they give you more opportunities to spot 
      clues when you investigate a mystery.'
    },
    {
      name: 'Premonitions',
      rating: :weird,
      six_and_under: 'On a miss, you get a vision of something bad happening 
      to you and the Keeper holds 3, to be spent one-for-one as penalties to 
      rolls you make.',
      seven_to_nine: 'On a 7-9+ you get clouded images of some-thing bad that 
      is yet to happen: mark experience if you stop it.',
      ten_plus: 'On a 10+, you get a detailed vision of some-thing bad that is 
      yet to happen. You take +1 forward to prevent it coming true, and mark 
      experience if you stop  it.',
      type: 'Moves::Rollable',
      playbook_id: @spooky.id,
      description: 'At the start of each mystery, roll +Weird.'
    },
    {
      name: 'Hunches',
      rating: :sharp,
      six_and_under: 'On a miss, you get there just in time to be in trouble 
      yourself',
      seven_to_nine: 'On a 7-9, you get there late—in time to intervene, but 
      not prevent it altogether.',
      ten_plus: 'On a 10+ you knew where you needed to go, just in time to 
      get there.',
      type: 'Moves::Rollable',
      playbook_id: @spooky.id,
      description: 'When something bad is happening (or just about to happen) 
      somewhere that you aren’t, roll +Sharp'
    },
    {
      name: 'Tune In',
      type: 'Moves::Descriptive',
      rating: :sharp,
      six_and_under: 'On a miss, the monster becomes aware of you.',
      seven_to_nine: 'On a 7-9, hold 1.',
      ten_plus: 'On a 10+, hold 3.',
      type: 'Moves::Rollable',
      playbook_id: @spooky.id,
      description: 'You can attune your mind to a monster or minion. Roll +Weird. 
      Spend one hold to ask the Keeper one of the following questions, and gain +1 
      ongoing while acting on the answers.
      \n • Where is the creature right now?
      \n • What is it planning to do right now?
      \n • Who is it going to attack next?
      \n • Who does it regard a the biggest threat?
      \n • How can i attract its attention?'
   },
   {
    name: 'The Big Whammy',
    type: 'Moves::Descriptive',
    playbook_id: @spooky.id,
    description:'You can use your powers to kick some ass: roll +Weird instead 
    of +Tough. The attack has 2-harm close obvious ignore-armor. On a miss, 
    you’ll get magical backlash.'
  },
  {
    name: 'Jinx',
    type: 'Moves::Descriptive',
    rating: :weird,
    six_and_under: 'On a miss, the Keeper holds 2 over you to be used in the 
    same way.',
    seven_to_nine: 'On a 7-9, hold 1.',
    ten_plus: 'On a 10+, hold 2.',
    type: 'Moves::Rollable',
    playbook_id: @spooky.id,
    description: 'You can encourage coincidences to occur, the way you want. 
    When you jinx a target, roll +Weird.
    \n • Interfere with a hunter, giving them -1 forward.
    \n • Help a hunter, giving them +1 forward, by interfering with the enemy.
    \n • Interfere with what a monster, minion, or bystander is trying to do.
    \n • Inflict 1-harm on the target due to an accident.
    \n • The target finds something you left for them.
    \n • The target loses something that you will soon find.'
  },].each do |move|
      Move.find_or_create_by!(move)
    end
  
    #####
    # Gear
    #####
  
    # Note: Spooky have custom weapons
  [
    {
      name: '.38 revolver',
      armor: 2,
      tag_list: %w[close reload loud]
    },
    {
      name: '9mm',
      armor: 2,
      tag_list: %w[close loud]
    },
    {
      name: 'Hunting rifle',
      armor: 2,
      tag_list: %w[far loud]
    },
    {
      name: 'Shotgun',
      armor: 3,
      tag_list: %w[close messy]
    },
    {
      name: 'Big knife',
      armor: 1,
      tag_list: %w[hand]
    },
  ].each do |gear_attrs|
    gear = Gear.find_or_create_by!(
      name: gear_attrs[:name],
      playbook: @professional
    )
    gear.update!(gear_attrs)

    #####
    # Improvements
    #####
    [
      {
        description: 'Get +1 Weird, max +3',
        type: 'Improvements::RatingBoost',
        stat_limit: 3,
        rating: :weird,
        playbook: @spooky
      },
      {
        description: 'Get +1 Charm, max +2',
        type: 'Improvements::RatingBoost',
        stat_limit: 2,
        rating: :charm,
        playbook: @spooky
      },
      {
        description: 'Get +1 Cool, max +2',
        type: 'Improvements::RatingBoost',
        stat_limit: 2,
        rating: :cool,
        playbook: @spooky
      },
      {
        description: 'Get +1 Sharp, max +2',
        type: 'Improvements::RatingBoost',
        stat_limit: 2,
        rating: :sharp,
        playbook: @spooky
      },
      {
        description: 'Take another Spooky move',
        type: 'Improvements::PlaybookMove',
        playbook: @spooky,
        stat_limit: 0
      },
      {
        description: 'Take another Spooky move',
        type: 'Improvements::PlaybookMove',
        playbook: @spooky,
        # Used to differentiate (and initially hide this) from the identical improvement above.
        stat_limit: -1
      },
      {
        description: 'Change some, or all, your dark side tags',
        playbook: @spooky,
      },
      {
        description: 'Get a mystical library, like the Expert’s haven option',
        type: 'Improvements::AnotherMove',
        playbook: @spooky,
        stat_limit: 0
      },
      {
        description: 'Take a move from another playbook',
        type: 'Improvements::AnotherMove',
        playbook: @spooky,
        stat_limit: 0
      },
      {
        description: 'Take a move from another playbook',
        type: 'Improvements::AnotherMove',
        playbook: @spooky,
        # Used to differentiate (and initially hide this) from the identical improvement above.
        stat_limit: -1
      },
      {
        description: 'Get +1 to any rating, max +3.',
        playbook: @spooky,
        type: 'Improvements::RatingBoost',
        stat_limit: 3,
        advanced: true
      },
      {
        description: 'Change this Hunter to a new type.',
        playbook: @spooky,
        type: 'Improvements::ChangePlaybook',
        advanced: true
      },
      {
        description: 'Create a second hunter to play as well as this one.',
        playbook: @spooky,
        advanced: true
      },
      {
        description: 'Mark two of the basic moves as advanced',
        playbook: @spooky,
        type: 'Improvements::AdvancedMove',
        advanced: true
      },
      {
        description: 'Mark another two of the basic moves as advanced',
        playbook: @spooky,
        type: 'Improvements::AdvancedMove',
        advanced: true
      },
      {
        description: 'Retire this hunter to safety.',
        playbook: @spooky,
        type: 'Improvements::Retire',
        advanced: true
      }
      {
        description: 'You discover how to use your powers at a lower price. 
        Delete one dark side tag permanently.',
        playbook: @spooky,
        advanced: true
      },
      {
        description: 'Get back one used Luck point.',
        playbook: @spooky,
        type: 'Improvements::RatingBoost',
        stat_limit: 7,
        rating: :luck,
        advanced: true
      },
    ].each do |improvement|
      Improvement.find_or_create_by!(improvement)
    end
  end
  