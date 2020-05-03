# frozen_string_literal: true

after :playbook, 'development:user' do
  @user = User.find_by email: 'test@example.com'
  [
    {
      name: 'Buffy',
      harm: 0,
      luck: 7,
      experience: 0,
      charm: 1,
      cool: 2,
      sharp: 1,
      tough: 1,
      weird: -1,
      playbook: @chosen,
      user: @user
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
      playbook: @wronged,
      user: @user
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
      playbook: @spooky,
      user: @user
    },
    {
      name: 'Fox Mulder',
      harm: 0,
      luck: 7,
      experience: 0,
      playbook: @searcher,
      charm: -1,
      cool: 2,
      sharp: 1,
      tough: 1,
      weird: 0,
      user: @user
    },
    {
      name: 'Dana Scully',
      harm: 0,
      luck: 7,
      experience: 0,
      playbook: @professional,
      charm: 1,
      cool: 2,
      sharp: 1,
      tough: -1,
      weird: 0,
      user: @user
    }
  ].each do |hunter|
    Hunter.find_or_initialize_by(name: hunter[:name]).update!(hunter)
  end
end
