# frozen_string_literal: true

[{
  name: 'Buffy',
  harm: 0,
  luck: 7,
  experience: 0,
  charm: 1,
  cool: 2,
  sharp: 1,
  tough: 1,
  weird: -1,
  playbook_id: 1
},
 {
   name: 'Dean Winchester',
   harm: 0,
   luck: 5,
   experience: 2,
   charm: 1,
   cool: 0,
   sharp: 1,
   tough: 2,
   weird: -1,
   playbook_id: 12
 },
 {
   name: 'Sam Winchester',
   harm: 1,
   luck: 6,
   experience: 1,
   charm: 2,
   cool: 0,
   sharp: -1,
   tough: -1,
   weird: 2,
   playbook_id: 11
 },
 {
   name: 'Fox Mulder',
   harm: 0,
   luck: 7,
   experience: 0,
   playbook_id: 9,
   charm: -1,
   cool: 2,
   sharp: 1,
   tough: 1,
   weird: 0
 },
 {
   name: 'Dana Scully',
   harm: 0,
   luck: 7,
   experience: 0,
   playbook_id: 9,
   charm: 1,
   cool: 2,
   sharp: 1,
   tough: -1,
   weird: 0
 }].each do |hunter|
  Hunter.find_or_create_by(hunter)
end
