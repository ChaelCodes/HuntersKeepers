# frozen_string_literal: true

after :playbook do
  ######
  # Initiate
  ######
  # initiate = Playbook.find_by name: 'The Initiate'
  [{
    playbook_id: @initiate.id,
    name: 'Old-fashioned armor',
    armor: 1,
    tag_list: 'heavy, old-fashioned'
  },
   {
     playbook_id: @initiate.id,
     name: 'Sword',
     harm: 2,
     tag_list: 'hand, messy, old-fashioned'
   },
   {
     playbook_id: @initiate.id,
     name: 'Axe',
     harm: 2,
     tag_list: 'hand, messy, old-fashioned'
   },
   {
     playbook_id: @initiate.id,
     name: 'Big sword',
     harm: 3,
     tag_list: 'hand, messy, heavy, old-fashioned'
   },
   {
     playbook_id: @initiate.id,
     name: 'Big axe',
     harm: 3,
     tag_list: 'hand, messy, slow, heavy, old-fashioned'
   },
   {
     playbook_id: @initiate.id,
     name: 'Silver knife',
     harm: 1,
     tag_list: 'hand, silver, old-fashioned'
   },
   {
     playbook_id: @initiate.id,
     name: 'Fighting sticks',
     harm: 1,
     tag_list: 'hand, quick, old-fashioned'
   },
   {
     playbook_id: @initiate.id,
     name: 'Spear',
     harm: 2,
     tag_list: 'hand, close, old-fashioned'
   },
   {
     playbook_id: @initiate.id,
     name: 'Mace',
     harm: 2,
     tag_list: 'hand, messy, old-fashioned'
   },
   {
     playbook_id: @initiate.id,
     name: 'Crossbow',
     harm: 2,
     tag_list: 'close, slow, old-fashioned'
   },
   {
     playbook_id: @initiate.id,
     name: '.38 revolver',
     harm: 2,
     tag_list: 'close, reload, loud, modern'
   },
   {
     playbook_id: @initiate.id,
     name: '9mm',
     harm: 2,
     tag_list: 'close, loud, modern'
   },
   {
     playbook_id: @initiate.id,
     name: 'Sniper rifle',
     harm: 3,
     tag_list: 'far, modern'
   },
   {
     playbook_id: @initiate.id,
     name: 'Magnum',
     harm: 3,
     tag_list: 'close, reload, loud,modern'
   },
   {
     playbook_id: @initiate.id,
     name: 'Shotgun',
     harm: 3,
     tag_list: 'close, messy, modern'
   }].each do |gear|
    tag_list = gear.delete(:tag_list)
    g = Gear.find_or_create_by!(gear)
    g.tag_list = tag_list
    g.save!
  end
end
