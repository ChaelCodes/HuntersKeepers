# frozen_string_literal: true

after :playbook do
  @crooked = Playbook.find_by! name: 'The Crooked'

  #####
  # Background Moves
  #####
  [{
    name: 'Hoodlum',
    type: 'Moves::Descriptive',
    playbook_id: @crooked.id,
    description: 'You can use Tough instead of Charm to
    manipulate someone with threats of violence'
  },
   {
     name: 'Burglar',
     type: 'Moves::Rollable',
     playbook_id: @crooked.id,
     description: 'When you break into a secure location, depending on your roll, you can pick some of the following:
    - you get in undetected
    - you get out undetected
    - you don’t leave a mess
    - you find what you were after',
     rating: :sharp,
     six_and_under: "On a miss, you are detected and don't gain entry, and you don't find what you are after.",
     seven_to_nine: 'On a 7-9 you can choose 2 of the following:
    - you get in undetected
    - you get out undetected
    - you don’t leave a mess
    - you find what you were after',
     ten_plus: 'On a 10+, you can choose 3 of the following:
    - you get in undetected
    - you get out undetected
    - you don’t leave a mess
    - you find what you were after'
   },
   {
     name: 'Grifter',
     type: 'Moves::Descriptive',
     playbook_id: @crooked.id,
     description: 'When you are about to manipulate
    someone, you can ask the Keeper “What will convince this person to do
    what I want?” The Keeper must answer honestly, but not necessarily completely.'
   },
   {
     name: 'Fixer',
     type: 'Moves::Rollable',
     playbook_id: @crooked.id,
     description: 'If you need to buy something, sell something, or hire someone, roll +Charm.',
     rating: :charm,
     six_and_under: 'On a miss, the only person who can help is someone who
      absolutely hates you.',
     seven_to_nine: 'On a 7-9 you know the only person who can do it,
      but there’s a complication.
      Pick one: you owe them; they screwed you over; you screwed them over',
     ten_plus: 'On a 10+ you know just the person who will be interested.'
   },
   {
     name: 'Assassin',
     type: 'Moves::Descriptive',
     playbook_id: @crooked.id,
     description: 'When you take your first shot at an unsuspecting target,
      do +2 Harm.'
   },
   {
     name: 'Charlatan',
     type: 'Moves::Rollable',
     playbook_id: @crooked.id,
     description: 'When you want people to think you are
    using magic, roll +Cool. You may also manipulate people with
    fortune telling. When you do that, ask “What are
    they hoping for right now?” as a free question (even
    on a miss).',
     rating: :cool,
     six_and_under: 'On a miss, you are not fooling anyone.',
     seven_to_nine: 'On a 7-9, you tripped up a couple of times,
      maybe someone will notice.',
     ten_plus: 'Your audience is amazed and fooled by your illusion.'
   },
   {
     name: 'Pickpocket',
     type: 'Moves::Rollable',
     playbook_id: @crooked.id,
     description: 'When you steal something small, roll
    +Charm.',
     rating: :charm,
     six_and_under: 'On a miss, you are caught pickpocketing.',
     seven_to_nine: 'On a 7-9 either you don’t grab it,
      you grab the wrong thing, or they remember you later: your choice.',
     ten_plus: 'On a 10 or more, you get it
      and they didn’t notice you taking it.'
   }].each do |move|
    Move.find_or_create_by!(move)
  end

  #####
  # Moves
  #####
  [
    {
      name: 'Artifact',
      type: 'Moves::Descriptive',
      playbook_id: @crooked.id,
      description: 'You ‘found’ a magical artifact with handy
        powers, and kept it. Pick one: Protective amulet
        (1-armour magic recharge), Lucky charm (may be
        used as a Luck point, once only), Grimoire (studying
        the book gives +1 forward to use magic), Skeleton
        key (opens any magically sealed lock), Imp stone (A
        weak demon is bound to serve the holder. The imp
        must be summoned with the use magic move).'
    },
    {
      name: 'Crew', # TEAM RULES
      type: 'Moves::Descriptive',
      playbook_id: @crooked.id,
      description: 'You have a regular crew, a team of three or
      four people who will help you out with pretty much
      anything. They count as a team.'
    },
    {
      name: 'Deal with the Devil',
      type: 'Moves::Descriptive',
      playbook_id: @crooked.id,
      description: 'You sold your soul to the Devil.
      Pick one or two things you got out of the deal: wealth,
      fame, youth, sensual gratification, skill (add +1 to
      two ratings). Payment is due either when you die, in
      six months (if you picked two things) or otherwise
      in a year'
    },
    {
      name: 'Friends on the Force',
      type: 'Moves::Rollable',
      playbook_id: @crooked.id,
      description: 'You know a few cops who
      can be persuaded to look the other way, or do you
      a favour, for certain considerations. You can act
      under pressure to get in touch with them when you
      need to divert any law enforcement attention. There
      will be a cost, although maybe not right now.',
      rating: :cool,
      six_and_under: "They're not answering your calls.",
      seven_to_nine: "There's a worse outcome, hard choice, or price to pay.",
      ten_plus: "They're willing to look the other way,
        but there'll be a price."
    },
    {
      name: 'Made',
      type: 'Moves::Descriptive',
      playbook_id: @crooked.id,
      description: 'You’re “made” in a gang. Name the gang and
      describe how their operations tie into your background.
      You can call on gang members to help you
      out, but they’ll expect to be paid. Your bosses will
      have requests for you now and again, but you’ll be
      paid. Minor trouble will be overlooked, but you
      better not screw over any other made gangsters.'
    },
    {
      name: 'Driver',
      type: 'Moves::Descriptive',
      playbook_id: @crooked.id,
      description: ' You have +1 ongoing while driving, plus you
      can hotwire anything (the older it is, the fewer tools
      you need to do it). You also own two handy, widely-available
      vehicles (perhaps a sportscar and a van).'
    },
    {
      name: 'Home Ground',
      type: 'Moves::Descriptive',
      playbook_id: @crooked.id,
      description: "Your crew made a point of keeping
      the locals happy - keeping them safe, ensuring things
      always went down okay. When you’re back in your
      old neighbourhood, you can always find people who
      will hide you or help you with a minor favour, no
      questions asked."
    },
    {
      name: 'Notorious',
      type: 'Moves::Descriptive',
      playbook_id: @crooked.id,
      description: 'You have a reputation from your criminal past.
      When you reveal who you are, your
      terrifying reputation counts as a reason for people
      to do what you ask, for the manipulate someone
      move. Revealing your identity to someone can create
      other problems later, of course.'
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
      description: 'Get +1 Sharp, max +3',
      stat_limit: 3,
      rating: :sharp
    },
    {
      type: 'Improvements::RatingBoost',
      description: 'Get +1 Tough, max +2',
      stat_limit: 2,
      rating: :tough
    },
    {
      type: 'Improvements::RatingBoost',
      description: 'Get +1 Cool, max +2',
      stat_limit: 2,
      rating: :cool
    },
    {
      type: 'Improvements::RatingBoost',
      description: 'Get +1 Charm, max +2',
      stat_limit: 2,
      rating: :charm
    },
    {
      type: 'Improvements::PlaybookMove',
      description: 'Take another Crooked move',
      stat_limit: 0
    },
    {
      type: 'Improvements::PlaybookMove',
      description: 'Take another Crooked move',
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
      type: 'Improvements::GainLuck',
      description: 'Erase one used luck mark from your playbook.',
      advanced: true
    }
  ].each do |improvement|
    Improvement.find_or_create_by!(playbook: @crooked, **improvement)
  end
end
