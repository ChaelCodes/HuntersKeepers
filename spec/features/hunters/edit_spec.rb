# frozen_string_literal: true

require 'rails_helper'

describe 'hunters#new' do
  let(:user) { create :user }
  let(:hunter) { create :hunter }

  before :each do
    sign_in user
  end

  context 'user created hunter' do
    let(:hunter) { create :hunter, user: user }
    let!(:playbook) { create :playbook, name: 'New Playbook' }

    it 'edits a hunter' do
      visit "/hunters/#{hunter.id}/edit"
      expect(page).to have_content 'Editing Hunter'
      fill_in 'hunter[name]', with: 'Mary Sue Bazooka'
      expect(page).to have_content 'Playbook'
      select(playbook.name, from: 'hunter[playbook_id]')
      fill_in 'hunter[harm]', with: 4
      fill_in 'hunter[luck]', with: 7
      fill_in 'hunter[experience]', with: 5
      fill_in 'hunter[charm]', with: -1
      fill_in 'hunter[cool]', with: 2
      fill_in 'hunter[sharp]', with: 1
      fill_in 'hunter[tough]', with: 0
      fill_in 'hunter[weird]', with: 3
      check 'hunter[retired]'
      click_button 'Update Hunter'
      expect(page).to have_content('Hunter was successfully updated.')
      expect(hunter.reload).to have_attributes(
        playbook_id: playbook.id,
        name: 'Mary Sue Bazooka',
        harm: 4,
        luck: 7,
        experience: 5,
        charm: -1,
        cool: 2,
        sharp: 1,
        tough: 0,
        weird: 3,
        retired: true
      )
    end
  end
end
