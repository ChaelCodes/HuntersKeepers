# frozen_string_literal: true

# Add Playbooks
[{
  id: 1,
  name: 'The Chosen',
  description: 'Your birth was prophesied. You are the Chosen
One, and with your abilities you can save the
world. If you fail, all will be destroyed. It all rests
on you. Only you.'
},
 {
   id: 2,
   name: 'The Crooked',
   description: 'Yeah, I’ve been around the block. A bit of this, a
bit of that. When I came across the secret underworld of monsters and magic… well… it wasn’t
so different from the underworld I already knew.
It was easy to find an angle, just like before.'
 },
 {
   id: 3,
   name: 'The Divine',
   description: 'I am the Light, the Sword.
I am sent to defend the meek from Darkness.
All Evil fears me, for I am its end.'
 },
 {
   id: 4,
   name: 'The Expert',
   description: 'I have dedicated my life to the study of the unnatural. I know their habits, their weaknesses. I may
not be youngest or strongest, but my knowledge
makes me the biggest threat.'
 },
 {
   id: 5,
   name: 'The Flake',
   description: 'Everything’s connected. But not everyone can
see the patterns, and most people don’t even
look that hard. But me, I can never stop looking
deeper. I can never stop seeing the truth. I spot
the patterns. That’s how I found the monsters,
and that’s how I help kill them.'
 },
 {
   id: 6,
   name: 'The Initiate',
   description: 'Since the dawn of history, we have been the
bulwark against Darkness. We know the Evils
of the world, and we stand against them so that
the mass of humanity need not fear. We are the
Flame that cleanses the Shadows.'
 },
 {
   id: 7,
   name: 'The Monstruous',
   description: 'I feel the hunger, the lust to destroy. But I fight
it: I never give in. I’m not human any more, not
really, but I have to protect those who still are.
That way I can tell myself I’m different to the
other monsters. Sometimes I can even believe it.'
 },
 {
   id: 8,
   name: 'The Mundane',
   description: 'You heard about how monsters only pick on
people with crazy powers who can fight back on
even terms? Yeah, me neither. But, hell, I ended
up in this monster-hunting team so I gotta do
what I can, right?'
 },
 {
   id: 9,
   name: 'The Professional',
   description: 'It’s kind of strange when your regular 9-to-5 job is
to hunt down monsters. Still, that’s the job I took
on when I joined this outfit. It pays well, and the
benefits are good. Like they say “You don’t have
to be crazy to work here, but it sure helps!”'
 },
 {
   id: 10,
   name: 'The Spell-Slinger',
   description: 'Fight fire with fire magic.'
 },
 {
   id: 11,
   name: 'The Spooky',
   description: 'I can do things, things that normal people can’t.
But there’s a price—I haven’t paid it in full, yet,
but the bill’s gonna come due soon. It’s best I don’t
tell you any more. You get too close, you’ll get hurt.'
 },
 {
   id: 12,
   name: 'The Wronged',
   description: 'They took my loved ones. Back then I wasn’t
strong enough to fight, but I studied, trained, and
now I’m ready to cleanse the world of their taint.
I’ll kill them all. That’s all I have left.'
 }].each do |playbook|
  Playbook.find_or_create_by(playbook)
end
