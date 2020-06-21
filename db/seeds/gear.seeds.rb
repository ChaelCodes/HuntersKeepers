# frozen_string_literal: true

after :playbook do
  [
    { name: '.22 Revolver', harm: 1, tags: 'close, reload, small', playbooks: [@crooked] },
    { name: '.38 Revolver', harm: 2, tags: 'close, reload, loud', playbooks: [@crooked, @flake, @initiate, @monstrous, @professional, @spooky, @wronged] },
    { name: '9mm', harm: 2, tags: 'close, loud', playbooks: [@crooked, @flake, @initiate, @monstrous, @professional, @spooky, @wronged] },
    { name: 'Assault Rifle', harm: 3, tags: 'far, area, loud, reload', playbooks: [@professional] },
    { name: 'Assault Rifle', harm: 3, tags: 'close/far, area',  playbooks: [@crooked] },
    { name: 'Assault Rifle', harm: 3, tags: 'close, area, loud, reload', playbooks: [@wronged] },
    { name: 'Axe', harm: 2, tags: 'hand, messy', playbooks: [@initiate] },
    { name: 'Baseball Bat', harm: 1, tags: 'hand', playbooks: [@crooked] },
    { name: 'Baseball Bat', harm: 2, tags: 'hand, innocuous, messy', playbooks: [@mundane] },
    { name: 'Bicycle', tags: '', playbooks: [@mundane] },
    { name: 'Big Axe', harm: 3, tags: 'hand, heavy, slow, messy', playbooks: [@initiate] },
    { name: 'Big Knife', harm: 1, tags: 'hand', playbooks: [@crooked, @flake, @monstrous, @professional, @spooky, @wronged] },
    { name: 'Big Sword', harm: 3, tags: 'hand, heavy, messy', playbooks: [@initiate] },
    { name: 'Blessed Knife', harm: 2, tags: 'hand, holy', playbooks: [@expert] },
    { name: 'Brass Knuckles', harm: 1, tags: 'hand, stealthy', playbooks: [@wronged] },
    { name: 'Brass Knuckles', harm: 1, tags: 'hand, quiet, small', playbooks: [@monstrous] },
    { name: 'Butterfly Knife/folding Knife', harm: 1, tags: 'hand', playbooks: [@flake] },
    { name: 'Car', tags: '', playbooks: [@professional] },
    { name: 'Chainsaw', harm: 3, tags: 'hand, messy, unreliable, loud, heavy', playbooks: [@wronged] },
    { name: 'Classic Car', tags: '', playbooks: [@wronged] },
    { name: 'Classic Car In Terrible Condition', tags: '', playbooks: [@mundane] },
    { name: 'Classic Motorcycle', tags: '', playbooks: [@wronged] },
    { name: 'Cold Iron Sword', harm: 2, tags: 'hand, messy, iron', playbooks: [@expert] },
    { name: 'Combat Armor', armor: 2, tags: 'heavy', playbooks: [@professional] },
    { name: 'Cricket Bat', harm: 2, tags: 'hand, innocuous, messy', playbooks: [@mundane] },
    { name: 'Crossbow', harm: 2, tags: 'close, slow', playbooks: [@initiate] },
    { name: 'Divine Armor', armor: 1, tags: 'holy', playbooks: [@divine] },
    { name: 'Enchanted Dagger', harm: 2, tags: 'hand, magic', playbooks: [@wronged] },
    { name: 'Fairly New Car In Good Condition', tags: '', playbooks: [@mundane] },
    { name: 'Fighting Knife', harm: 2, tags: 'hand, quiet',  playbooks: [@wronged] },
    { name: 'Fighting Sticks', harm: 1, tags: 'hand, quick', playbooks: [@initiate] },
    { name: 'Fire Axe', harm: 3, tags: 'hand, messy', playbooks: [@mundane] },
    { name: 'Five Demon Bag', harm: 3, tags: 'close, magic, holy', playbooks: [@divine] },
    { name: 'Flak Vest', armor: 1, tags: 'hidden', playbooks: [@professional] },
    { name: 'Flamethrower', harm: 3, tags: 'close, fire, heavy, volatile', playbooks: [@expert] },
    { name: 'Flaming Sword', harm: 3, tags: 'hand, fire, holy', playbooks: [@divine] },
    { name: 'Garrote', harm: 3, tags: 'intimate', playbooks: [@flake] },
    { name: 'Golf Club', harm: 2, tags: 'hand, innocuous, messy', playbooks: [@mundane] },
    { name: 'Grenade Launcher', harm: 4, tags: 'far, area, messy, loud, reload', playbooks: [@professional] },
    { name: 'Grenades', harm: 4, tags: 'close, area, messy, loud', playbooks: [@professional] },
    { name: 'Hand Cannon', harm: 3, tags: 'close, loud', playbooks: [@wronged] },
    { name: 'Heirloom Sword', harm: 2, tags: 'hand, messy', playbooks: [@spell_slinger] },
    { name: 'Hockey Stick', harm: 2, tags: 'hand, innocuous, messy', playbooks: [@mundane] },
    { name: 'Holdout Pistol', harm: 2, tags: 'close, loud, reload', playbooks: [@flake] },
    { name: 'Huge Axe', harm: 3, tags: 'hand, messy, heavy', playbooks: [@wronged] },
    { name: 'Huge Sword', harm: 3, tags: 'hand, messy, heavy', playbooks: [@wronged] },
    { name: 'Huge Sword', harm: 3, tags: 'hand, heavy', playbooks: [@monstrous] },
    { name: 'Hunting Rifle', harm: 3, tags: 'far, loud, reload', playbooks: [@mundane] },
    { name: 'Hunting Rifle', harm: 2, tags: 'far, loud', playbooks: [@crooked, @flake, @professional, @spooky, @wronged] },
    { name: 'Juju Bag', harm: 1, tags: 'far, magic', playbooks: [@expert] },
    { name: 'Mace', harm: 2, tags: 'hand, messy', playbooks: [@initiate] },
    { name: 'Magical Dagger', harm: 2, tags: 'hand, magic', playbooks: [@expert] },
    { name: 'Magnum', harm: 3, tags: 'close, reload, loud', playbooks: [@expert, @flake, @initiate, @monstrous] },
    { name: 'Mallet And Wooden Stakes', harm: 3, tags: 'intimate, slow, wooden', playbooks: [@expert] },
    { name: 'Motorcycle', tags: '', playbooks: [@mundane] },
    { name: 'Multitool', harm: 1, tags: 'hand, useful, small', playbooks: [@mundane] },
    { name: 'Nunchucks', harm: 2, tags: 'hand, area', playbooks: [@mundane] },
    { name: 'Old Revolver', harm: 2, tags: 'close, reload, loud', playbooks: [@spell_slinger] },
    { name: 'Old-fashioned Armor', armor: 1, tags: 'heavy', playbooks: [@initiate] },
    { name: 'Plain Pickup', tags: '', playbooks: [@wronged] },
    { name: 'Plain Van', tags: '', playbooks: [@wronged] },
    { name: 'Pocket Knife', harm: 1, tags: 'hand, useful, small', playbooks: [@mundane] },
    { name: 'Protective Wear', armor: 1, tags: '', playbooks: [@wronged] },
    { name: 'Protective Gear', armor: 1, tags: '', playbooks: [@chosen] },
    { name: 'Razor Whip', harm: 3, tags: 'hand, area, messy, holy', playbooks: [@divine] },
    { name: 'Ritual Knife', harm: 1, tags: 'hand', playbooks: [@spell_slinger] },
    { name: 'Sawn-off Shotgun', harm: 3, tags: 'hand/close, messy, loud, reload', playbooks: [@wronged] },
    { name: 'Shotgun', harm: 3, tags: 'close, messy, loud', playbooks: [@expert, @flake, @wronged] },
    { name: 'Shotgun', harm: 3, tags: 'close, messy', playbooks: [@crooked, @initiate, @monstrous, @professional, @spooky] },
    { name: 'Silver Knife', harm: 1, tags: 'hand, silver', playbooks: [@initiate] },
    { name: 'Silver Sword', harm: 2, tags: 'hand, messy, silver', playbooks: [@expert] },
    { name: 'Silver Trident', harm: 3, tags: 'hand, silver, holy', playbooks: [@divine] },
    { name: 'Skateboard', tags: '', playbooks: [@mundane] },
    { name: 'Sledgehammer', harm: 3, tags: 'hand, messy', playbooks: [@mundane] },
    { name: 'Small Handgun', harm: 2, tags: 'close, loud, reload', playbooks: [@mundane] },
    { name: 'Sniper Rifle', harm: 4, tags: 'far', playbooks: [@professional] },
    { name: 'Sniper Rifle', harm: 3, tags: 'far', playbooks: [@initiate] },
    { name: 'Spear', harm: 2, tags: 'hand/close', playbooks: [@initiate] },
    { name: 'Specialist Weapon (Other Foe)', harm: 1, tags: "Keeper's Discretion", playbooks: [@wronged] },
    { name: 'Specialist Weapons (Chosen Foe)', harm: 4, tags: "Keeper's Discretion", playbooks: [@wronged] },
    { name: 'Submachine Gun', harm: 2, tags: 'close, reload, area', playbooks: [@crooked] },
    { name: 'Submachine Gun', harm: 3, tags: 'close, area, loud, reload', playbooks: [@professional] },
    { name: 'Sword', harm: 2, tags: 'hand, messy', playbooks: [@initiate, @monstrous] },
    { name: 'Throwing Knives', harm: 1, tags: 'close, many', playbooks: [@flake] },
    { name: 'Thunder Hammer', harm: 3, tags: 'hand, stun, holy', playbooks: [@divine] },
    { name: 'Truck', tags: '', playbooks: [@professional] },
    { name: 'Van', tags: '', playbooks: [@mundane, @professional] },
    { name: 'Vehicle', tags: '', playbooks: [@crooked] },
    { name: "Watchman's Flashlight", harm: 1, tags: 'hand', playbooks: [@flake] },
    { name: 'Weighted Gloves/Brass Knuckles', harm: 1, tags: 'hand', playbooks: [@flake] }
  ].each do |gear|
    tag_list = gear.delete(:tags)
    playbooks = gear.delete(:playbooks)
    g = Gear.find_or_initialize_by(gear)
    g.tag_list = tag_list
    g.playbooks << playbooks
    g.save!
  end

  # Builds out the PlaybookGear category field.  For each playbook that
  # has a category list, it checks the list of gears and finds if the gear is
  # found within a category and if that category matches one of the approved
  # list for the playbook. If it does, the category name is converted to a
  # string and then saved in the through table.

  categories = {
    # Flake, Professional (Professional does not have Hunting Rifle option)
    normal: ['.38 Revolver', '9mm', 'Hunting Rifle',
             'Magnum', 'Shotgun', 'Big knife'],
    # The Flake
    hidden: ['Throwing Knives', 'Holdout Pistol', 'Garrote',
             "Watchman's Flashlight", 'Weighted Gloves/Brass Knuckles',
             'Butterfly Knife/Folding Knife'],
    # The Initiate
    old_fashioned: ['Sword', 'Axe', 'Big Sword', 'Big Axe', 'Silver Knife',
                    'Fighting Sticks', 'Spear', 'Mace', 'Crossbow'],
    # The Initiate
    modern: ['.38 Revolver', '9mm', 'Sniper Rifle', 'Magnum', 'Shotgun'],
    # The Professional (See above for second option)
    serious: ['Assault Rifle', 'Grenade Launcher', 'Sniper Rifle',
              'Grenades', 'Submachine Gun'],
    # The Wronged
    signature: ['Sawn-off Shotgun', 'Hand Cannon', 'Fighting Knife',
                'Huge Sword', 'Huge Axe', 'Specialist Weapons (Chosen Foe)',
                'Specialist Weapon (Other Foe)', 'Enchanted Dagger', 'Chainsaw'],
    # The Wronged
    practical: ['.38 Revolver', '9mm', 'Hunting Rifle', 'Shotgun', 'Big Knife',
                'Brass Knuckles', 'Assault Rifle'],
    # Vehicles and Transport
    transport: ['Vehicle', 'Skateboard', 'Bicycle',
                'Fairly New Car In Good Condition',
                'Classic Car In Terrible Condition', 'Motorcycle', 'Van',
                'Truck', 'Car', 'Classic Car', 'Classic Motorcycle',
                'Plain Pickup', 'Plain Van']
  }

  @playbooks.each do |playbook|
    next if playbook.category_list.blank?
    playbook.gears.each do |gear|
      categories.each do |name, gear_list|
        if playbook.category_list.include?(name.to_s) && gear_list.include?(gear.name)
          category_name = name.to_s
          PlaybookGear.find_or_initialize_by(gear: gear, playbook: playbook).update!(category: category_name)

        end
      end
    end
  end
end
