# frozen_string_literal: true

after :playbook do
  @divine = Playbook.find_by! name: 'The Divine'

  [
    {
      name: 'Boss from Beyond',
      type: 'Moves::Rollable',
      rating: :weird,
      description: 'At the beginning of each mystery, roll +Weird.',
      ten_plus: "On a 10+, your Superiors ask \
      you to do something simple, and  you get to ask them \
      one of the questions from the investigate a mystery \
      move right now.",
      seven_to_nine: "On a 7-9, they ask you
      to do something complicated or difficult, but you get \
      to ask them one of the questions from the investigate a \
      mystery move right now.",
      six_and_under: "On a miss, you are required to do something terrible. \
      If you do not accomplish what they’ve ordered, you cannot use this move \
      again until you have made up for your failure."
    },
    {
      name: 'Angel Wings',
      type: 'Moves::Rollable',
      rating: :weird,
      description: "You can go instantly to anywhere you’ve \
      visited before, or to a person you know well. \
      When you carry one or two people with you, roll +Weird.",
      ten_plus: 'On a 10+ you all go where you wanted.',
      seven_to_nine: "On a 7-9, you don’t quite manage it. \
      Either you are all separated, or you all appear in the \
      wrong place.",
      six_and_under: "On less than a 6, you're all separated \
      and in the wrong places."
    },
    {
      name: 'What I Need, When I Need It',
      type: 'Moves::Descriptive',
      description: "You may store any small object you own, \
      putting it into a magical space nobody can get to. \
      You may retrieve anything you stored at any time; \
      it appears in your hand."
    },
    {
      name: 'Smite',
      type: 'Moves::Descriptive',
      description: "Your body and divine weapon always count \
      as a weakness against the monsters you fight. \
      Your unarmed attacks are 2-harm intimate hand messy."
    },
    {
      name: 'Soothe',
      type: 'Moves::Descriptive',
      description: "When you talk to someone for a few \
        seconds in a quiet voice, you can calm them down, \
        blocking any panic, anger, or other negative emotions \
        they have. This works even if the thing that freaked \
        them out is still present, as long as your voice can be heard."
    },
    {
      name: 'Lay on Hands',
      description: "Your touch can heal injury and disease. \
      When you lay your hands on someone hurt, roll +Cool.",
      type: 'Moves::Rollable',
      rating: :cool,
      ten_plus: 'On a 10+, heal 2 harm or an illness, plus they’re stabilized.',
      seven_to_nine: "On a 7-9, you can heal 2 harm or an illness, \
      and stabilize them, but you take the harm or illness into yourself.",
      six_and_under: 'On a miss, your aura causes them extra harm.'
    },
    {
      name: 'Cast Out Evil',
      description: "You may banish an unnatural creature from your presence. \
      Roll +Tough.",
      type: 'Moves::Rollable',
      rating: :tough,
      ten_plus: "On a 10+ it is banished. The banished creature is unharmed, \
      and you have no control over where it goes.",
      seven_to_nine: "On a 7-9 it takes a little while \
        for the banishing to take effect—the creature \
        has time to make one or two actions. The banished creature \
        is unharmed, and you have no control over where it goes.",
      six_and_under: 'On a miss, something is keeping it here. That’s bad.'
    }
  ].each do |move|
    Move.find_or_create_by!(playbook: @divine, **move)
  end

  [
    {
      type: 'Improvements::RatingBoost',
      description: 'Get +1 Tough, max +3',
      stat_limit: 3,
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
      type: 'Improvements::RatingBoost',
      description: 'Get +1 Sharp, max +2',
      stat_limit: 2,
      rating: :sharp
    },
    {
      type: 'Improvements::RatingBoost',
      description: 'Get +1 Weird, max +2',
      stat_limit: 2,
      rating: :weird
    },
    {
      type: 'Improvements::PlaybookMove',
      description: 'Take another Divine move',
      stat_limit: 0
    },
    {
      type: 'Improvements::PlaybookMove',
      description: 'Take another Divine move',
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
    },
    {
      type: 'Improvements::Retire',
      description: 'Retire this hunter to safety.',
      advanced: true
    }
  ].each do |improvement|
    Improvement.find_or_create_by!(playbook: @divine, **improvement)
  end

  [
    {
      name: 'Smite Unarmed Attack',
      harm: 2,
      description: "Your body and divine weapon always \
      count as a weakness against the monsters you fight. \
      Your unarmed attacks are 2-harm intimate hand messy. \
      You must have the Smite move to add this weapon.",
      tag_list: %w[intimate hand messy]
    },
    {
      name: 'Flaming Sword',
      harm: 3,
      tag_list: %w[hand fire holy]
    },
    {
      name: 'Thunder hammer',
      harm: 3,
      tag_list: %w[hand stun holy]
    },
    {
      name: 'Razor whip',
      harm: 3,
      tag_list: %w[hand area messy holy]
    },
    {
      name: 'Five demon bag',
      harm: 3,
      tag_list: %w[close magic holy]
    },
    {
      name: 'Silver trident',
      harm: 3,
      tag_list: %w[hand silver holy]
    },
    {
      name: 'Divine armor',
      armor: 1,
      tag_list: %w[holy]
    }
  ].each do |gear_attrs|
    gear = Gear.find_or_create_by!(
      name: gear_attrs[:name],
      playbook: @divine
    )
    gear.update!(gear_attrs)
  end
end
