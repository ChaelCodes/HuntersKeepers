# frozen_string_literal: true

[{
  name: 'Manipulate Someone',
  description: 'Once you have given them a reason, tell '\
  'them what you want them to do and roll '\
  '+Charm',
  rating: 'charm',
  six_and_under: "Failure. Keeper's choice.",
  seven_to_nine: 'On a 7-9, they’ll do it, but only if '\
  'you do something for them right '\
  'now to show that you mean it. If '\
  'you asked too much, they’ll tell '\
  'you what, if anything, it would '\
  'take for them to do it.',
  ten_plus: 'On a 10+, then they’ll do it for '\
  'the reason you gave them. If you '\
  'asked too much, they’ll tell you the '\
  'minimum it would take for them '\
  'to do it (or if there’s no way they’d '\
  'do it).',
  twelve_plus: 'On a 12+ not only do '\
  'they do what you want right now, '\
  'they also become your ally for the '\
  'rest of the mystery (or, if you do '\
  'enough for them, permanently).'
},
 {
   name: 'Act Under Pressure',
   description: 'When you act under pressure, roll +Cool.',
   rating: 'cool',
   six_and_under: "Failure. Keeper's choice.",
   seven_to_nine: 'On a 7-9 the Keeper is going to give '\
   'you a worse outcome, hard choice, or '\
   'price to pay.',
   ten_plus: 'On a 10+ you do what you set out to.',
   twelve_plus: 'On a 12+ you may choose to either do what you wanted '\
   'and something extra, or to do what you wanted to absolute perfection.'
 },
 {
   name: 'Help Out',
   description: 'When you help another hunter, roll +Cool.',
   rating: 'cool',
   six_and_under: "Failure. Keeper's choice.",
   seven_to_nine: 'On a 7-9 your help grants them +1 to '\
   'their roll, but you also expose yourself '\
   'to trouble or danger.',
   ten_plus: 'On a 10+ your help grants them +1 to their roll.',
   twelve_plus: 'On a 12+ your help '\
   'lets them act as if they just rolled a 12, '\
   'regardless of what they actually got.'
 },
 {
   name: 'Investigate a Mystery',
   description: 'When you investigate a mystery, roll '\
   '+Sharp. On a 10+ hold 2, and on a 7-9 '\
   'hold 1. One hold can be spent to ask the '\
   "Keeper one of the following questions:\n"\
   " • What happened here?\n"\
   " • What sort of creature is it?\n"\
   " • What can it do?\n"\
   " • What can hurt it?\n"\
   " • Where did it go?\n"\
   " • What was it going to do?\n"\
   " • What is being concealed here",
   rating: 'sharp',
   six_and_under: "Failure. Keeper's choice.",
   seven_to_nine: 'You can ask the '\
   'Keeper one of the following questions: '\
   " • What happened here?\n"\
   " • What sort of creature is it?\n"\
   " • What can it do?\n"\
   " • What can hurt it?\n"\
   " • Where did it go?\n"\
   " • What was it going to do?\n"\
   " • What is being concealed here",
   ten_plus: 'You can ask the '\
   "Keeper two of the following questions:\n"\
   " • What happened here?\n"\
   " • What sort of creature is it?\n"\
   " • What can it do?\n"\
   " • What can hurt it?\n"\
   " • Where did it go?\n"\
   " • What was it going to do?\n"\
   ' • What is being concealed here?',
   twelve_plus: 'On a 12+, you may ask the '\
   'Keeper any two questions you want about the '\
   'mystery, not just the listed ones.'
 },
 {
   name: 'Read a Bad Situation',
   description: 'When you look around and read a bad situation, roll +Sharp.',
   rating: 'sharp',
   six_and_under: "Failure. Keeper's choice.",
   seven_to_nine: "Ask the Keeper one of the following questions:\n"\
   " • What’s my best way in?\n"\
   " • What’s my best way out?\n"\
   " • Are there any dangers we haven’t noticed?\n"\
   " • What’s the biggest threat?\n"\
   " • What’s most vulnerable to me?\n"\
   " • What’s the best way to protect the victims? "\
   'If you act on the answers, you get +1 '\
   'ongoing while the information is relevant.',
   ten_plus: "Ask the Keeper any three of the following questions:\n"\
   " • What’s my best way in?\n"\
   " • What’s my best way out?\n"\
   " • Are there any dangers we haven’t noticed?\n"\
   " • What’s the biggest threat?\n"\
   " • What’s most vulnerable to me?\n"\
   ' • What’s the best way to protect the victims? '\
   'If you act on the answers, you get +1 '\
   'ongoing while the information is relevant.',
   twelve_plus: 'You may ask the keeper any three any question you want about '\
   'the situation, not just the listed ones. If you act on the answers, you '\
   'get +1 ongoing while the information is relevant.'
 },
 {
   name: 'Kick some Ass',
   description: 'When you get into a fight and kick some '\
   'ass, roll +Tough.',
   rating: 'tough',
   six_and_under: 'Failure. You take a beating.',
   seven_to_nine: 'You and whatever you’re '\
   'fighting inflict harm on each other. The '\
   'amount of harm is based on the established dangers in the game. That usually '\
   'means you inflict the harm rating of '\
   'your weapon and your enemy inflicts '\
   'their attack’s harm rating on you.',
   ten_plus: 'You and whatever you’re '\
   'fighting inflict harm on each other. The '\
   'amount of harm is based on the established dangers in the game. That usually '\
   'means you inflict the harm rating of '\
   'your weapon and your enemy inflicts '\
   'their attack’s harm rating on you. '\
   "On a 10+, choose one extra effect:\n"\
   ' • You gain the advantage: take +1 forward, or give +1 forward to another hunter. '\
   " • You inflict terrible harm (+1 harm).\n"\
   " • You suffer less harm (-1 harm).\n"\
   ' • You force them where you want them.',
   twelve_plus: 'You and whatever you’re '\
   'fighting inflict harm on each other. The '\
   'amount of harm is based on the established dangers in the game. That usually '\
   'means you inflict the harm rating of '\
   'your weapon and your enemy inflicts '\
   'their attack’s harm rating on you. '\
   'On a 12+ instead pick '\
   "an enhanced effect:\n"\
   ' • You completely hold the advantage. All hunters involved in the '\
   'fight get +1 forward. '\
   " • You suffer no harm at all.\n"\
   " • Your attack inflicts double the normal harm.\n"\
   ' • Your attack drives the enemy away in a rout.'
 },
 {
   name: 'Protect Someone',
   description: 'When you prevent harm to another character, roll +Tough',
   rating: 'tough',
   six_and_under: 'Failure. You fail to preotect them, '\
   'and you expose yourself to danger.',
   seven_to_nine: 'You protect them okay, but '\
   'you’ll suffer some or all of the harm they '\
   'were going to get. ',
   ten_plus: 'You protect them okay, but '\
   'you’ll suffer some or all of the harm they '\
   "were going to get. Choose an extra:\n"\
   " • You suffer little harm (-1 harm).\n"\
   " • All impending danger is now focused on you.\n"\
   " • You inflict harm on the enemy.\n"\
   ' • You hold the enemy back.',
   twelve_plus: 'Both you and '\
   'the character you are protecting are '\
   'unharmed and out of danger. If you '\
   'were protecting a bystander, they also '\
   'become your ally.'
 },
 {
   name: 'Use Magic',
   description: 'When you use magic, say what you’re '\
   'trying to achieve and how you do the '\
   'spell, then roll +Weird.',
   rating: 'weird',
   six_and_under: "Failure. Keeper's choice. It is always bad.",
   seven_to_nine: 'It works imperfectly: choose '\
   'your effect and a glitch. The Keeper will '\
   'decide what effect the glitch has. '\
   "Effects:\n"\
   " • Inflict harm (1-harm ignorearmour magic obvious).\n"\
   " • Enchant a weapon. It gets +1 harm and +magic.\n"\
   " • Do one thing that is beyond human limitations.\n"\
   " • Bar a place or portal to a specific person or a type of creature.\n"\
   " • Trap a specific person, minion, or monster.\n"\
   " • Banish a spirit or curse from the person, object, or place it inhabits.\n"\
   " • Summon a monster into the world.\n"\
   " • Communicate with something that you do not share a language with.\n"\
   " • Observe another place or time.\n"\
   " • Heal 1-harm from an injury, or cure a disease, or neutralize a poison.\n"\
   "Glitches:\n"\
   " • The effect is weakened.\n"\
   " • The effect is of short duration.\n"\
   " • You take 1-harm ignore-armour.\n"\
   " • The magic draws immediate, unwelcome attention.\n"\
   ' • It has a problematic side effect.',
   ten_plus: 'The magic works without '\
   "issues: choose your effect.\n"\
   " • Inflict harm (1-harm ignorearmour magic obvious).\n"\
   " • Enchant a weapon. It gets +1 harm and +magic.\n"\
   " • Do one thing that is beyond human limitations.\n"\
   " • Bar a place or portal to a specific person or a type of creature.\n"\
   " • Trap a specific person, minion, or monster.\n"\
   " • Banish a spirit or curse from the person, object, or place it inhabits.\n"\
   " • Summon a monster into the world.\n"\
   " • Communicate with something that you do not share a language with.\n"\
   " • Observe another place or time.\n"\
   ' • Heal 1-harm from an injury, or '\
   'cure a disease, or neutralize a '\
   'poison.',
   twelve_plus: 'The Keeper '\
   'will offer you some added benefit. '\
   'The magic works without '\
   "issues: choose your effect.\n"\
   " • Inflict harm (1-harm ignorearmour magic obvious).\n"\
   " • Enchant a weapon. It gets +1 harm and +magic.\n"\
   " • Do one thing that is beyond human limitations.\n"\
   " • Bar a place or portal to a specific person or a type of creature.\n"\
   " • Trap a specific person, minion, or monster.\n"\
   " • Banish a spirit or curse from the person, object, or place it inhabits.\n"\
   " • Summon a monster into the world.\n"\
   ' • Communicate with something '\
   'that you do not share a language '\
   "with.\n"\
   " • Observe another place or time.\n"\
   ' • Heal 1-harm from an injury, or cure a disease, or neutralize a '\
   'poison.'
 },
 {
   name: 'Alt: Empath',
   rating: 'weird',
   six_and_under: 'Your brain is overwhelmed with emotion.',
   seven_to_nine: 'You gain a hazy impression of their current emotional '\
   'state and intentions.',
   ten_plus: 'You gain a clear impression of their current '\
   'emotional state and intentions. Take +1 forward when acting on '\
   'this knowledge.',
   twelve_plus: 'You get an impression (as for 10 or more), and '\
   'you may ask one follow-up question that the Keeper will answer '\
   'honestly.'
 },
 {
   name: 'Alt: Illuminated',
   rating: 'weird',
   six_and_under: 'The Secret Masters’ reply is terrible, garbled, or '\
   'somehow dangerously wrong.',
   seven_to_nine: 'The Secret Masters need you to complete a task for them. '\
   'Once it is done, they reveal a key fact, clue, or technique that will '\
   'help you.',
   ten_plus: 'The Secret Masters reveal a key fact, clue, or '\
   'technique that will help you.',
   twelve_plus: 'The Secret Masters reveal a key fact, clue, '\
   'or technique that will help you. You may ask one follow-up '\
   'question that the Keeper will answer honestly.'
 },
 {
   name: 'Alt: No Limits',
   rating: 'weird',
   six_and_under: 'Something goes horribly wrong.',
   seven_to_nine: 'You do it but choose one consequence: suffer 1-harm, '\
   'take –1 forward, or you need to rest right now',
   ten_plus: 'Your body obeys your will, to the limits of physical '\
   'possibility (see below), for a moment.',
   twelve_plus: 'You can continue acting at your body’s limits for 30 seconds.'
 },
 {
   name: 'Alt: Past Lives',
   rating: 'weird',
   six_and_under: 'A past life takes over for a while.',
   seven_to_nine: 'A past life has a little experience with this. Ask the '\
   "Keeper one of the questions below\n"\
   " • What did a past life discover about ___________?\n"\
   " • How did a past life deal with __________?\n"\
   " • What important hidden secret can a past life show me the way to?\n"\
   " • What did a past life learn too late to help them?\n"\
   " • What does a past life advise me to do now\n",
   ten_plus: 'A past life has something useful to offer. Ask the '\
   "Keeper two of the questions below.\n"\
   " • What did a past life discover about ___________?\n"\
   " • How did a past life deal with __________?\n"\
   " • What important hidden secret can a past life show me the way to?\n"\
   " • What did a past life learn too late to help them?\n"\
   ' • What does a past life advise me to do now?',
   twelve_plus: 'A past life knows exactly what you were after. Ask '\
   'the Keeper one of the questions below, and one free-form question. '\
   "Gain +1 ongoing while acting on the answers.\n"\
   " • What did a past life discover about ___________?\n"\
   " • How did a past life deal with __________?\n"\
   " • What important hidden secret can a past life show me the way to?\n"\
   " • What did a past life learn too late to help them?\n"\
   ' • What does a past life advise me to do now?'
 },
 {
   name: 'Alt: Sentive',
   rating: 'weird',
   six_and_under: 'Your brain makes contact with something dangerous.',
   seven_to_nine: 'You gain a hazy impression about something important.',
   ten_plus: 'You gain a definite impression (a vision, tangible '\
   'aura, overheard thought, etc) about something important.',
   twelve_plus: 'You get an impression as for 10 or more, plus '\
   'you may ask one follow-up question that the Keeper will answer '\
   'honestly.'
 },
 {
   name: 'Alt: Trust Your Gut',
   rating: 'weird',
   six_and_under: 'Your instincts lead you into danger',
   seven_to_nine: 'The Keeper will tell you a general direction to go. Take +1 '\
   'forward as you explore that.',
   ten_plus: 'The Keeper will tell where you should go. Wherever that is, '\
   'it will be important.  You get +1 ongoing on the way to this place.',
   twelve_plus: 'In addition to the usual 10+ result, the Keeper will '\
   'tell you about one important thing you should investigate further.'
 },
 {
   name: 'Alt: Telekinesis',
   rating: 'weird',
   six_and_under: 'Something goes horribly wrong.',
   seven_to_nine: "You move it but it hurts.  Choose one option and mark 2-harm.\n"\
   " • Something is held fast.\n"\
   " • Something is hurt (2-harm smash).\n"\
   " • Something catches fire.\n"\
   " • You can fling something bigger than a person.\n"\
   " • You keep it basically under your control.\n"\
   ' • You suffer 1 less harm.',
   ten_plus: "You move it.  Choose two options and mark 1-harm.\n"\
   " • Something is held fast.\n"\
   " • Something is hurt (2-harm smash).\n"\
   " • Something catches fire.\n"\
   " • You can fling something bigger than a person.\n"\
   " • You keep it basically under your control.\n"\
   ' • You suffer 1 less harm.',
   twelve_plus: 'Choose three options. You may also choose from '\
   'the advanced options: '\
   "Normal Options:\n"\
   " • Something is held fast.\n"\
   " • Something is hurt (2-harm smash).\n"\
   " • Something catches fire.\n"\
   " • You can fling something bigger than a person.\n"\
   " • You keep it basically under your control.\n"\
   " • You suffer 1 less harm.\n"\
   "Advanced Options:\n"\
   " • Something explodes (3-harm close fire area messy)\n"\
   " • Something implodes (3-harm close crush)\n"\
   " • Lots of stuff is flying under your control.\n"\
   ' • You have perfect and precise control over exactly what happens.'
 },
 {
   name: 'Alt: Weird Science',
   rating: 'weird',
   six_and_under: 'Something goes horribly wrong. You are still able to '\
   "create your device, but the Keeper picks three requirements.\n"\
   " • It needs a rare and/or weird material.\n"\
   " • It won’t be very reliable.\n"\
   " • It requires huge amounts of power or fuel.\n"\
   " • It will take a long time to get it working.\n"\
   " • It won’t work exactly as you intended.\n"\
   ' • You’ll need help (beyond the hunters on your team) to finish it.',
   seven_to_nine: 'you pick one requirement and the Keeper picks a second one. '\
   "It needs a rare and/or weird material.\n"\
   " • It won’t be very reliable.\n"\
   " • It requires huge amounts of power or fuel.\n"\
   " • It will take a long time to get it working.\n"\
   " • It won’t work exactly as you intended.\n"\
   ' • You’ll need help (beyond the hunters on your team) to finish it.',
   ten_plus: "You pick two requirements.\n"\
   " • It needs a rare and/or weird material.\n"\
   " • It won’t be very reliable.\n"\
   " • It requires huge amounts of power or fuel.\n"\
   " • It will take a long time to get it working.\n"\
   " • It won’t work exactly as you intended.\n"\
   " • You’ll need help (beyond the hunters on your team) to finish it",
   twelve_plus: "On a 12 or more, you gain +1 ongoing when operating the device.\n"\
   " • It needs a rare and/or weird material.\n"\
   " • It won’t be very reliable.\n"\
   " • It requires huge amounts of power or fuel.\n"\
   " • It will take a long time to get it working.\n"\
   " • It won’t work exactly as you intended.\n"\
   ' • You’ll need help (beyond the hunters on your team) to finish it.'
 }].each do |move|
  Moves::Basic.find_or_create_by(move)
end

[{
  name: 'Lore Library',
  description: "When you hit the books, take +1 "\
  "forward to investigate the mystery (as long as "\
  "historical or reference works are appropriate).",
  type: 'Moves::Descriptive',
  haven: true
},
 {
   name: 'Mystical Library',
   description: "If you use your library’s occult "\
   "tomes and grimoires, preparing with your tomes "\
   "and grimoires, take +1 forward for use magic.",
   type: 'Moves::Descriptive',
   haven: true
 },
 {
   name: 'Protection Spells',
   description: "Your haven is safe from monsters—they "\
   "cannot enter. Monsters might be able to do something "\
   "special to evade the wards, but not easily.",
   type: 'Moves::Descriptive',
   haven: true
 },
 {
   name: 'Armory',
   description: "You have a stockpile of mystical and "\
   "rare monster-killing weapons and items.",
   type: 'Moves::Rollable',
   rating: :weird,
   six_and_under: 'On a miss, you’ve got the wrong thing.',
   seven_to_nine: 'On a 7-9 you have it, but only the minimum.',
   ten_plus: 'On a 10+ you have it (and plenty if that matters).',
   haven: true
 },
 {
   name: 'Infirmary',
   description: "You can heal people, and have the space "\
   "for one or two to recuperate. The Keeper will tell you "\
   "how long any patient’s recovery is likely to take, and "\
   "if you need extra supplies or help.",
   type: 'Moves::Descriptive',
   haven: true
 },
 {
   name: 'Workshop',
   description: "You have a space for building and repairing "\
   "guns, cars and other gadgets. Work out with the Keeper how "\
   "long any repair or construction will take, and if you need "\
   "extra supplies or help.",
   type: 'Moves::Descriptive',
   haven: true
 },
 {
   name: 'Oubliette',
   description: "This room is isolated from every kind of "\
   "monster, spirit and magic that you know about. Anything "\
   "you stash in there can’t be found, can’t do any magic, "\
   "and can’t get out.",
   type: 'Moves::Descriptive',
   haven: true
 },
 {
   name: 'Panic Room',
   description: "This has essential supplies and is protected "\
   "by normal and mystical means. You can hide out there for a "\
   "few days, safe from pretty much anything.",
   type: 'Moves::Descriptive',
   haven: true
 },
 {
   name: 'Magical Library',
   description: "You have a mystical lab with all kinds "\
   "of weird ingredients and tools useful for casting spells "\
   "(like the use magic move, big magic, and any other "\
   "magical moves).",
   type: 'Moves::Descriptive',
   haven: true
 }].each do |move|
  Move.find_or_create_by(move)
end

after :playbook do
  ######
  # Playbook Moves
  # ratings: charm: 0, cool: 1, sharp: 2, tough: 3, weird: 4
  ######

  ######
  # Initiate
  ######
  [{
    name: 'Get Help from your Sect',
    type: 'Moves::Rollable',
    playbook_id: @initiate.id,
    description: 'When you are in good standing with your Sect, at '\
    'the beginning of each mystery, roll +Charm. On '\
    'a 10+ they provide some useful info or help in the '\
    'field. On a 7-9 you get a mission associated with the '\
    'mystery, and if you do it you’ll get some info or help '\
    'too. On a miss, they ask you to do something bad. '\
    'If you fail a mission or refuse an order, you’ll be in '\
    'trouble with the Sect until you atone.',
    rating: :charm,
    six_and_under: 'On a miss, they ask you to do something bad. '\
    'If you fail a mission or refuse an order, you’ll be in '\
    'trouble with the Sect until you atone.',
    seven_to_nine: 'On a 7-9 you get a mission associated with the '\
    'mystery, and if you do it you’ll get some info or help too.',
    ten_plus: 'On a 10+ they provide some useful info or help in the field.'
  },
   {
     name: 'Ancient Fighting Arts',
     type: 'Moves::Descriptive',
     playbook_id: @initiate.id,
     description: 'When using an old-fashioned hand weapon, you inflict +1 '\
     'harm and get +1 whenever you roll protect someone.'
   },
   {
     name: 'Mystic',
     type: 'Moves::Descriptive',
     playbook_id: @initiate.id,
     description: 'Every time you successfully use magic, take +1 forward.'
   },
   {
     name: 'Fortunes',
     type: 'Moves::Rollable',
     playbook_id: @initiate.id,
     description: 'The Sect has ancient prophecies or divination techniques '\
     'to predict the future. Once per mystery, you may use them. If you look '\
     'at what the future holds, roll +Weird. On a 10+ hold 3, and on '\
     'a 7-9 hold 1. On a miss, you get bad information and '\
     "the Keeper decides how that affects you. Spend your hold to:\n"\
     " • have a useful object ready.\n"\
     " • be somewhere you are needed, just in time.\n"\
     " • take +1 forward, or give +1 forward to another hunter.\n"\
     ' • retroactively warn someone about an attack, so that it doesn’t happen.',
     rating: :weird,
     six_and_under: 'On a miss, you get bad information and '\
     'the Keeper decides how that affects you.',
     seven_to_nine: "Spend your 1 hold to:\n"\
     " • have a useful object ready.\n"\
     " • be somewhere you are needed, just in time.\n"\
     " • take +1 forward, or give +1 forward to another hunter.\n"\
     ' • retroactively warn someone about an attack, so that it doesn’t happen.',
     ten_plus: "Spend your 3 hold to:\n"\
     " • have a useful object ready.\n"\
     " • be somewhere you are needed, just in time.\n"\
     " • take +1 forward, or give +1 forward to another hunter.\n"\
     ' • retroactively warn someone about an attack, so that it doesn’t happen.'
   },
   {
     name: 'Sacred Oath',
     type: 'Moves::Descriptive',
     playbook_id: @initiate.id,
     description: ' You may bind yourself to a single goal, '\
     'forsaking something during your quest (e.g. speech, '\
     'all sustenance but bread and water, alcohol, lying, '\
     'sex, etc). Get the Keeper’s agreement on this—it '\
     'should match the goal in importance and difficulty. '\
     'While you keep your oath and work towards your '\
     'goal, mark experience at the end of every session '\
     'and get +1 on any rolls that directly help achieve the '\
     'goal. If you break the oath, take -1 ongoing until you '\
     'have atoned.'
   },
   {
     name: 'Mentor',
     type: 'Moves::Rollable',
     playbook_id: @initiate.id,
     description: 'You have a mentor in the Sect: name '\
     'them. When you contact your mentor for info, roll '\
     '+Sharp. On a 10+, you get an answer to your question, no problem. On '\
     'a 7-9 you choose: they’re either '\
     'busy and can’t help, or they answer the question but '\
     'you owe a favour. On a miss, your question causes '\
     'trouble.',
     rating: :sharp,
     six_and_under: 'On a miss, your question causes trouble.',
     seven_to_nine: 'On a 7-9 you choose: they’re either '\
     'busy and can’t help, or they answer the question but '\
     'you owe a favour.',
     ten_plus: 'On a 10+, you get an answer to your question, no problem.'
   },
   {
     name: 'Apprentice',
     type: 'Moves::Descriptive',
     playbook_id: @initiate.id,
     description: 'You have an apprentice: name them. '\
     'Your job is to teach them the Sect’s ways. They count '\
     'as an ally: subordinate (motivation: to follow your '\
     'instructions to the letter).'
   },
   {
     name: 'Helping Hand',
     type: 'Moves::Descriptive',
     playbook_id: @initiate.id,
     description: 'When you successfully help out '\
     'another hunter, they get +2 instead of the usual +1.'
   },
   {
     name: 'That Old Black Magic',
     type: 'Moves::Descriptive',
     playbook_id: @initiate.id,
     description: 'When you use magic, you '\
     'can ask a question from the investigate a mystery '\
     'move as your effect.'
   }].each do |move|
    Move.find_or_create_by!(move)
  end
end
