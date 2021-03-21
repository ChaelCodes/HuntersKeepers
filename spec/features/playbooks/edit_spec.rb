# frozen_string_literal: true

require 'rails_helper'

describe 'playbooks#edit' do
  let(:user) { create :user, :admin }
  let!(:playbook) { create :playbook, :with_backstory, luck_effect: 'Is lucky' }

  before :each do
    sign_in user
    visit "/playbooks/#{playbook.id}/edit".dup
  end

  it 'edits the playbook' do
    expect(page).to have_content 'Editing Playbook'
    fill_in 'playbook[luck_effect]', with: 'This is a luck effect.'
    fill_in 'playbook[backstory][headings][][name]', with: 'A DIFFERENT NAME'
    fill_in 'playbook[backstory][headings][][count]', with: 2
    click_button 'Update Playbook'
      expect(page).to have_content('Playbook was successfully updated.')
      expect(playbook.reload).to have_attributes(
        luck_effect: 'This is a luck effect.'
      )
      expect(playbook.backstory.headings).to include({name: "A DIFFERENT NAME", count: '2'})
  end

  context 'with regular user' do
    let(:user) { create :user }

    it 'prevents user from accessing edit' do
      expect(page).to have_content 'You are not authorized to perform this action.'
    end
  end
end
