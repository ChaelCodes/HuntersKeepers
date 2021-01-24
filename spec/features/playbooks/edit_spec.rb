# frozen_string_literal: true

require 'rails_helper'

describe 'playbooks#edit' do
  let(:user) { create :user, :admin }
  let!(:playbook) { create :playbook, luck_effect: 'Is lucky' }

  before :each do
    sign_in user
    visit "/playbooks/#{playbook.id}/edit".dup
  end

  it 'edits the playbook' do
    expect(page).to have_content 'Editing Playbook'
    fill_in 'playbook[luck_effect]', with: 'This is a luck effect.'
    click_button 'Update Playbook'
      expect(page).to have_content('Playbook was successfully updated.')
      expect(playbook.reload).to have_attributes(
        luck_effect: 'This is a luck effect.'
      )
  end

  context 'with regular user' do
    let(:user) { create :user }

    it 'prevents user from accessing edit' do
      expect(page).to have_content 'You are not authorized to perform this action.'
    end
  end
end
