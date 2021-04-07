# frozen_string_literal: true

require 'rails_helper'

describe 'hunters#edit' do
  let(:user) { create :user }
  let(:hunter) { create :hunter }

  before :each do
    sign_in user
  end

  context 'user created hunter' do
    let(:hunter) { create :hunter, user: user }
    let!(:playbook) { create :playbook, name: 'New Playbook' }
    let!(:move) { create :move }

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

    it 'adds moves', js: true do
      visit "/hunters/#{hunter.id}/edit".dup
      expect(page).to have_content(move.name)
      expect(page).to have_content 'Submit Moves'
    end
  end

  describe 'delete action' do
    let(:have_delete_link) { have_link I18n.t('hunters.show.destroy'), href: hunter_path(hunter) }

    before :each do
      sign_in user
      visit "/hunters/#{hunter.id}/edit"
    end

    context 'when user is logged in' do
      let(:user) { create(:user) }

      it { expect(page).not_to have_delete_link }
    end

    context 'when admin is logged in' do
      let(:user) { create(:user, :admin) }

      it { expect(page).to have_delete_link }
    end
  end
end
