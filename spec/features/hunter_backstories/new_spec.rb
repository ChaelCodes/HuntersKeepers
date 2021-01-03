# frozen_string_literal: true

require 'rails_helper'

describe 'hunters/:id/hunter_backstories/new' do
  let(:user) { create :user }
  let(:hunter) { create :hunter, user: user, playbook: playbook }
  let(:playbook) { create :playbook }

  before :each do
    sign_in user
  end

  subject { visit "/hunters/#{hunter.id}/hunter_backstories/new".dup }

  it 'creates a hunter backstory' do
    subject
    expect(page).to have_content 'New Hunter'
    expect(page).to have_select('hunter_backstory[hunter_id]',
                                selected: hunter.name)
    expect(page).to have_select('hunter_backstory[playbook_id]',
                                selected: playbook.name)
    fill_in 'hunter_backstory[choices]',
            with: '[{ "name": "Fate", "choices": ["Some weirdo told you"]}]'
    click_button 'Create Hunter backstory'
    expect(page).to have_content('Hunter backstory was successfully created.')
    expect(HunterBackstory.last).to have_attributes(
      hunter_id: hunter.id,
      playbook_id: playbook.id
    )
  end

  it 'back leaves the page' do
    subject
    click_link 'Back'
    expect(page).to have_content 'Hunter Backstories'
  end
end
