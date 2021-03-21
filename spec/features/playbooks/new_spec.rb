# frozen_string_literal: true

require 'rails_helper'

describe 'playbooks#new' do
  let(:user) { create :user, :admin }

  before :each do
    sign_in user
    visit "/playbooks/new".dup
  end

  it 'creates the playbook' do
    expect(page).to have_content 'New Playbook'
    fill_in 'playbook[name]', with: 'The Unnamed'
    fill_in 'playbook[luck_effect]', with: 'This is a luck effect.'
    fill_in 'playbook[backstory][name]', with: 'Fate'
    click_button 'Create Playbook'
      expect(page).to have_content('Playbook was successfully created.')
      playbook = Playbook.last
      expect(playbook).to have_attributes(
        name: 'The Unnamed'
      )
      expect(playbook.backstory).to have_attributes(
        name: 'Fate'
      )
  end

  context 'with regular user' do
    let(:user) { create :user }

    it 'prevents user from accessing new' do
      expect(page).to have_content 'You are not authorized to perform this action.'
    end
  end
end
