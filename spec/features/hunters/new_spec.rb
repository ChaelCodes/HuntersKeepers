# frozen_string_literal: true

require 'rails_helper'

describe 'hunters#new' do
  let(:user) { create :user }
  let!(:playbook) { create :playbook }
  let!(:rating) { create :rating, playbook: playbook }

  before :each do
    sign_in user
  end

  it 'creates a hunter', js: true do
    visit '/hunters/new'.dup
    expect(page).to have_content 'New Hunter'
    fill_in 'hunter[name]', with: 'Mary Sue Bazooka'
    expect(page).to have_content 'Playbooks'
    select(playbook.name, from: 'hunter[playbook_id]')
    select("Charm: 1, Cool: -1, Sharp: 0, Tough: 2, Weird: -2", from: 'hunter[rating_id]')
    click_button 'Create Hunter'
    expect(page).to have_content('Hunter was successfully created.')
    expect(Hunter.last).to have_attributes(
      name: 'Mary Sue Bazooka',
      playbook_id: playbook.id,
      charm: 1,
      cool: -1,
      sharp: 0,
      tough: 2,
      weird: -2,
      harm: 0,
      luck: 7,
      experience: 0
    )
  end

  it 'does not create a hunter', js: true do
    visit '/hunters/new'.dup
    expect(page).to have_content 'New Hunter'
    click_button 'Create Hunter'
    expect(page).to have_content('prohibited this from being saved')
  end
end
