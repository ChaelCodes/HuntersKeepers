# frozen_string_literal: true

# Add Playbooks
[
  {
    name: 'The Chosen',
    description: 'Your birth was prophesied. You are the Chosen
      One, and with your abilities you can save the
      world. If you fail, all will be destroyed. It all rests
      on you. Only you.',
    luck_effect: 'When you spend a point of Luck, the Keeper will bring your fate into play.'
  },
  {
    name: 'The Crooked',
    description: 'Yeah, I’ve been around the block. A bit of this, a
      bit of that. When I came across the secret underworld of monsters
      and magic… well… it wasn’t so different from the underworld I
      already knew. It was easy to find an angle, just like before.',
    luck_effect: 'Whenever you spend a Luck point, someone from your past will re-appear in your life. Soon.'
  },
  {
    name: 'The Divine',
    description: 'I am the Light, the Sword.
      I am sent to defend the meek from Darkness.
      All Evil fears me, for I am its end.',
    luck_effect: "When you spend a point of Luck, you get " \
      "word your Mission requires something difficult that must " \
      "be done. By you. Urgently."
  },
  {
    name: 'The Expert',
    description: 'I have dedicated my life to the study of the
      unnatural. I know their habits, their weaknesses. I may
      not be youngest or strongest, but my knowledge
      makes me the biggest threat.',
    luck_effect: "When you spend a point of Luck, you " \
      "discover something happening now is related to " \
      "something you were involved in years ago."
  },
  {
    name: 'The Flake',
    description: 'Everything’s connected. But not everyone can
      see the patterns, and most people don’t even
      look that hard. But me, I can never stop looking
      deeper. I can never stop seeing the truth. I spot
      the patterns. That’s how I found the monsters,
      and that’s how I help kill them.',
    luck_effect: "When you spend a point of Luck, pick an " \
    "aspect of the current situation. The Keeper will tell you " \
    "what other conspiracies that aspect connects to."
  },
  {
    name: 'The Initiate',
    description: 'Since the dawn of history, we have been the
      bulwark against Darkness. We know the Evils
      of the world, and we stand against them so that
      the mass of humanity need not fear. We are the
      Flame that cleanses the Shadows.',
    luck_effect: "When you spend a point of Luck, something goes wrong for your Sect: an ill-advised project or a disastrous operation."
  },
  {
    name: 'The Monstrous',
    description: 'I feel the hunger, the lust to destroy. But I fight
      it: I never give in. I’m not human any more, not
      really, but I have to protect those who still are.
      That way I can tell myself I’m different to the
      other monsters. Sometimes I can even believe it.',
    luck_effect: "When you spend a point of Luck, " \
      "your monster side gains power: your Curse may become " \
      "stronger, or another Breed disadvantage may manifest."
  },
  {
    name: 'The Mundane',
    description: 'You heard about how monsters only pick on
      people with crazy powers who can fight back on
      even terms? Yeah, me neither. But, hell, I ended
      up in this monster-hunting team so I gotta do
      what I can, right?',
    luck_effect: "When you spend a point of Luck, you’ll find something weird—maybe even useful!"
  },
  {
    name: 'The Professional',
    description: 'It’s kind of strange when your regular 9-to-5 job is
      to hunt down monsters. Still, that’s the job I took
      on when I joined this outfit. It pays well, and the
      benefits are good. Like they say “You don’t have
      to be crazy to work here, but it sure helps!”',
    luck_effect: "When you spend a point of Luck, " \
      "your next mission from the Agency comes with lots of " \
      "Red Tape. Lots."
  },
  {
    name: 'The Spell-Slinger',
    description: 'Fight fire with fire magic.',
    luck_effect: "When you spend a point of Luck, " \
      "the official council of wizards is going to poke their nose" \
      "into your business."
  },
  {
    name: 'The Spooky',
    description: 'I can do things, things that normal people can’t.
      But there’s a price—I haven’t paid it in full, yet,
      but the bill’s gonna come due soon. It’s best I don’t
      tell you any more. You get too close, you’ll get hurt.',
    luck_effect: "As you mark off Luck boxes, your dark side’s needs will get nastier."
  },
  {
    name: 'The Wronged',
    description: 'They took my loved ones. Back then I wasn’t
      strong enough to fight, but I studied, trained, and
      now I’m ready to cleanse the world of their taint.
      I’ll kill them all. That’s all I have left.',
    luck_effect: "When you spend a point of Luck, you find a dangerous lead on your prey."
  },
  {
    name: 'The Gumshoe',
    description: 'You won’t understand this… When I take a case,
      I’m supposed to do something about it. You’re supposed to do
      something about it whether you like it or not. You’ve got
      to pay for what you’ve done, sweetheart, whatever it is I
      might feel about you. Yes, I’ll have some bad nights, but
      I’ll still have myself.',
    luck_effect: ''
  },
  {
    name: 'The Hex',
    description: 'I didn’t have magic fall into my lap. I’m not
      blessed, I’m not one of the scary children—I’m just a girl
      who found a way to give herself the strength to fight this
      war. I don’t have the option of not taking this risk.',
    luck_effect: ''
  },
  {
    name: 'The Pararomantic',
    description: 'I am never alone so long as we have each other.',
    luck_effect: ''
  },
  {
    name: 'The Searcher',
    description: 'There’s still so much to be discovered and
      explained, even now. Perhaps only one event in a thousand is
      true weirdness — but I’ll investigate them all to find it.',
    luck_effect: ''
  }
].each do |playbook|
  Playbook.find_or_initialize_by(name: playbook[:name]).update!(playbook)
end

# used by other seedfiles to associate data with playbooks
@chosen = Playbook.find_by name: 'The Chosen'
@crooked = Playbook.find_by name: 'The Crooked'
@divine = Playbook.find_by name: 'The Divine'
@expert = Playbook.find_by name: 'The Expert'
@flake = Playbook.find_by name: 'The Flake'
@initiate = Playbook.find_by name: 'The Initiate'
@monstrous = Playbook.find_by name: 'The Monstrous'
@mundane = Playbook.find_by name: 'The Mundane'
@professional = Playbook.find_by name: 'The Professional'
@spell_slinger = Playbook.find_by name: 'The Spell-Slinger'
@spooky = Playbook.find_by name: 'The Spooky'
@wronged = Playbook.find_by name: 'The Wronged'
@gumshoe = Playbook.find_by name: 'The Gumshoe'
@hex = Playbook.find_by name: 'The Hex'
@pararomantic = Playbook.find_by name: 'The Pararomantic'
@searcher = Playbook.find_by name: 'The Searcher'
@initiate = Playbook.find_by name: 'The Initiate'
