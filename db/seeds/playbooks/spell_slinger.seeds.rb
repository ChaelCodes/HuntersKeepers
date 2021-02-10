after :playbook do
  @spell_slinger = Playbook.find_by! name: 'The Spell-Slinger'

  ######
  # Moves
  # ratings: charm: 0, cool: 1, sharp: 2, tough: 3, weird: 4
  ######

  [{
    name: "Advanced Arcane Training",
    type: 'Moves::Descriptive',
    playbook_id: @spell_slinger.id,
    description: "If you have two of your \
      three Tools and Techniques at the ready, you may \
      ignore the third one."
  },
  {
    name: "Arcane Reputation",
    type: 'Moves::Descriptive',
    playbook_id: @spell_slinger.id,
    description: "Pick three big organizations or \
      groups in the supernatural community, which can \
      include some of the more sociable types of monsters. \
      They’ve heard of you and respect your power. With \
      affected humans, take +1 forward when you manipulate them. You may manipulate affected monsters \
      as if they were human, with no bonus."
  },
  {
    name: 'Could’ve Been Worse',
    type: 'Moves::Descriptive',
    playbook_id: @spell_slinger.id,
    description: "When you miss a use magic  \
      roll you can choose one of the following options \
      instead of losing control of the magic:
      \n - Fizzle: The preparations and materials for the \
      spell are ruined. You’ll have to start over from \
      scratch with the prep time doubled.
      \n - This Is Gonna Suck: The effect happens, but \
      you trigger all of the listed glitches but one. You \
      pick the one you avoid."
  },
  {
    name: 'Enchanted Clothing',
    type: 'Moves::Descriptive',
    playbook_id: @spell_slinger.id,
    description: "Pick an article of every-day \
      clothing–it’s enchanted without any change in \
      appearance. Take -1 harm from any source that tries \
      to get at you through the garment."
  },
  {
    name: 'Forensic Divination',
    type: 'Moves::Descriptive',
    playbook_id: @spell_slinger.id,
    description: "When you successfully investigate a mystery, you may ask 'What magic was \
      done here?' as a free extra question."
  },
  {
    name: 'Go Big or Go Home',
    type: 'Moves::Descriptive',
    playbook_id: @spell_slinger.id,
    description: "When you must use magic \
      as a requirement for Big Magic, take +1 ongoing to \
      those use magic rolls."
  },
  {
    name: 'Not My Fault',
    type: 'Moves::Descriptive',
    playbook_id: @spell_slinger.id,
    description: "+1 to act under pressure when you \
      are dealing with the consequences of your own spellcasting."
  },
  {
    name: 'Practitioner',
    type: 'Moves::Descriptive',
    playbook_id: @spell_slinger.id,
    description: "Choose two effects available to you \
      under use magic. Take +1 to use magic whenever \
      you choose one of those effects."
  },
  {
    name: 'Shield Spell',
    type: 'Moves::Descriptive',
    playbook_id: @spell_slinger.id,
    description: "When you protect someone, gain \
      2-armour against any harm that is transferred to you. \
      This doesn’t stack with your other armour, if any."
  },
  {
    name: 'Third Eye',
    type: 'Moves::Descriptive',
    playbook_id: @spell_slinger.id,
    description: "When you read a bad situation, you can \
    open up your third eye for a moment to take in \
    extra information. Take +1 hold on any result of 7 \ 
    or more, plus you can see invisible things. On a miss, \
    you may still get 1 hold, but you’re exposed to supernatural danger. Unfiltered hidden reality is rough on \
    the mind!" 
  }].each do |move|
    m = Move.find_or_initialize_by(name: move[:name], playbook_id: move[:playbook_id])
    m.update!(move)
  end

  #####
  # Gear
  #####
  [
    {
      name: 'Old revolver',
      harm: 2,
      tag_list: %w[close reload loud]
    },
    {
      name: 'Ritual knife',
      harm: 1,
      tag_list: %w[harm hand]
    },
    {
      name: 'Heirloom sword',
      harm: 2,
      tag_list: %w[harm hand messy]
    }
  ].each do |gear_attrs|
    gear = Gear.find_or_create_by!(
      name: gear_attrs[:name],
      playbook: @spell_slinger
    )
    gear.update!(gear_attrs)
  end

  #####
  # Improvements
  #####
  [
    {
      description: 'Get +1 Weird, max +3',
      type: 'Improvements::RatingBoost',
      stat_limit: 3,
      rating: :charm,
      playbook: @spell_slinger
    },
    {
      description: 'Get +1 Cool, max +2',
      type: 'Improvements::RatingBoost',
      stat_limit: 2,
      rating: :cool,
      playbook: @spell_slinger
    },
    {
      description: 'Get +1 Sharp, max +2',
      type: 'Improvements::RatingBoost',
      stat_limit: 2,
      rating: :sharp,
      playbook: @spell_slinger
    },
    {
      description: 'Get +1 Tough, max +2',
      type: 'Improvements::RatingBoost',
      stat_limit: 2,
      rating: :tough,
      playbook: @spell_slinger
    },
    {
      description: 'Take another Spell-Slinger move',
      type: 'Improvements::PlaybookMove',
      playbook: @spell_slinger,
      stat_limit: 0
    },
    {
      description: 'Take another Spell-Slinger move',
      type: 'Improvements::PlaybookMove',
      playbook: @spell_slinger,
      # Used to differentiate (and initially hide this) from the identical improvement above.
      stat_limit: -1
    },
    {
      description: 'Take a move from another playbook',
      type: 'Improvements::AnotherMove',
      playbook: @spell_slinger,
      stat_limit: 0
    },
    {
      description: 'Take a move from another playbook',
      type: 'Improvements::AnotherMove',
      playbook: @spell_slinger,
      # Used to differentiate (and initially hide this) from the identical improvement above.
      stat_limit: -1
    },
    {
      description: 'Take another Combat Magic pick.',
      playbook: @spell_slinger
    },
    {
      description: 'Get +1 to any rating, max +3.',
      playbook: @spell_slinger,
      type: 'Improvements::RatingBoost',
      advanced: true
    },
    {
      description: 'Change this hunter to a new type.',
      playbook: @spell_slinger,
      type: 'Improvements::ChangePlaybook',
      advanced: true
    },
    {
      description: 'Create a second hunter to play as well as this one.',
      playbook: @spell_slinger,
      advanced: true
    },
    {
      description: 'Mark two of the basic moves as advanced.',
      playbook: @spell_slinger,
      type: 'Improvements::AdvancedMove',
      advanced: true
    },
    {
      description: 'Mark another two of the basic moves as advanced.',
      playbook: @spell_slinger,
      type: 'Improvements::AdvancedMove',
      advanced: true
    },
    {
      description: 'Retire this hunter to safety.',
      playbook: @spell_slinger,
      type: 'Improvements::Retire',
      advanced: true
    },
    {
      description: 'Erase one used Luck mark from your playbook.',
      playbook: @spell_slinger,
      type: 'Improvements::GainLuck',
      advanced: true
    },
    {
      description: 'Take another Combat Magic pick.',
      playbook: @spell_slinger,
      advanced: true
    },
    {
      description: 'You may cross off another option from your Tools and Techniques.',
      playbook: @spell_slinger,
      advanced: true
    }
  ].each do |improvement|
    Improvement.find_or_create_by!(improvement)
  end
end
