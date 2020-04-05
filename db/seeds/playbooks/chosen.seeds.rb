# frozen_string_literal: true

@chosen = Playbook.find_by name: 'The Chosen'

######
# Moves
# ratings: charm: 0, cool: 1, sharp: 2, tough: 3, weird: 4
######
[{
  name: "Destiny's Plaything",
  rating: :weird,
  six_and_under: 'On a miss, something bad is going to happen to you.',
  seven_to_nine: 'On
a 7-9 you get a vague hint about the coming mystery.',
  ten_plus: "On a 10+, the Keeper will
reveal a useful detail about the coming mystery.",
  type: 'Moves::Rollable',
  playbook_id: @chosen.id,
  description: 'At the beginning of each
mystery, roll +Weird to see what is revealed about
your immediate future.'
},
 {
   name: 'I’m Here For A Reason',
   type: 'Moves::Descriptive',
   playbook_id: @chosen.id,
   description: 'There’s something you are
destined to do. Work out the details with the Keeper,
based on your fate. You cannot die until it comes
to pass. If you die in play, then you must spend a
Luck point. You will then, somehow, recover or be
returned to life. Once your task is done (or you use
up all your Luck), all bets are off.'
 },
 {
   name: 'The Big Entrance',
   rating: :cool,
   six_and_under: 'On a miss, you’re marked as the
biggest threat by all enemies who are present.',
   seven_to_nine: 'On a 7-9, you pick one
person or monster to stop, watch and listen until
you finish talking.',
   ten_plus: 'On 10+ everyone stops to watch and listen until you
finish your opening speech.',
   type: 'Moves::Rollable',
   playbook_id: @chosen.id,
   description: 'When you make a showy
entrance into a dangerous situation, roll +Cool.'
 },
 {
   name: 'Devastating',
   type: 'Moves::Descriptive',
   playbook_id: @chosen.id,
   description: 'When you inflict harm, you may
inflict +1 harm.'
 },
 {
   name: 'Dutiful',
   type: 'Moves::Descriptive',
   playbook_id: @chosen.id,
   description: 'When your fate rears its ugly head, and
you act in accordance with any of your fate tags
(either heroic or doom) then mark experience. If it’s
a heroic tag, take +1 forward'
 },
 {
   name: 'Invincible',
   type: 'Moves::Descriptive',
   playbook_id: @chosen.id,
   description: 'You always count as having 2-armour.
This doesn’t stack with other protection.'
 },
 {
   name: 'Resilience',
   type: 'Moves::Descriptive',
   playbook_id: @chosen.id,
   description: 'You heal faster than normal people. Any
time your harm gets healed, heal an extra point.
Additionally, your wounds count as 1-harm less for
the purpose of the Keeper’s harm moves.'
 }].each do |move|
  Move.find_or_create_by(move)
end

#####
# Gear
#####

# Note: Chosen have custom weapons

#####
# Improvements
#####
[{
  description: 'Get +1 Charm, max +3',
  type: 'Improvements::RatingBoost',
  stat_limit: 3,
  rating: :charm,
  playbook: @chosen
},
 {
   description: 'Get +1 Cool, max +3',
   type: 'Improvements::RatingBoost',
   stat_limit: 3,
   rating: :cool,
   playbook: @chosen
 },
 {
   description: 'Get +1 Sharp, max +3',
   type: 'Improvements::RatingBoost',
   stat_limit: 3,
   rating: :sharp,
   playbook: @chosen
 },
 {
   description: 'Get +1 Weird, max +3',
   type: 'Improvements::RatingBoost',
   stat_limit: 3,
   rating: :tough,
   playbook: @chosen
 },
 {
   description: 'Get +1 Tough, max +3',
   type: 'Improvements::RatingBoost',
   stat_limit: 3,
   rating: :weird,
   playbook: @chosen
 },
 {
   description: 'Take another Chosen move',
   type: 'Improvements::PlaybookMove',
   playbook: @chosen,
   rating: :weird
 },
 {
   description: 'Take another Chosen move',
   type: 'Improvements::PlaybookMove',
   playbook: @chosen,
   rating: :cool
 },
 {
   description: 'Take a move from another playbook',
   type: 'Improvements::AnotherMove',
   playbook: @chosen,
   rating: :cool
 },
 {
   description: 'Take a move from another playbook',
   type: 'Improvements::AnotherMove',
   playbook: @chosen,
   rating: :weird
 },
 {
   description: 'Gain an Ally',
   playbook: @chosen
 },
 {
   description: 'Get +1 to any rating, max +3.',
   playbook: @chosen,
   type: 'Improvements::RatingBoost',
   stat_limit: 3,
   advanced: true
 },
 {
   description: 'Get back one used Luck point.',
   playbook: @chosen,
   type: 'Improvements::GainLuck',
   advanced: true
 },
 {
   description: 'Change this Hunter to a new type.',
   playbook: @chosen,
   type: 'Improvements::ChangePlaybook',
   advanced: true
 },
 {
   description: 'Create a second  hunter to play as well as this one.',
   playbook: @chosen,
   advanced: true
 },
 {
   description: 'Mark two of the basic moves as advanced',
   playbook: @chosen,
   type: 'Improvements::AdvancedMove',
   advanced: true
 },
 {
   description: 'Mark another two of the basic moves as advanced',
   playbook: @chosen,
   type: 'Improvements::AdvancedMove',
   advanced: true
 },
 {
   description: 'Retire this Hunter to safety.',
   playbook: @chosen,
   advanced: true
 }].each do |improvement|
  Improvement.find_or_create_by(improvement)
end
