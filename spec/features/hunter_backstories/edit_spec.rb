# frozen_string_literal: true

require 'rails_helper'

describe 'hunter_backstories/:id/edit' do
  let(:user) { hunter_backstory.hunter.user }
  let(:hunter_backstory) { create :hunter_backstory }

  before :each do
    sign_in user
  end

  it 'edits a hunter backstory' do
    visit "/hunter_backstories/#{hunter_backstory.id}/edit".dup
    expect(page).to have_content 'Editing Hunter Backstory'
    page.find_by_id('hunter_backstory_choice_Heroic_1').find("option[value='Visions']").select_option
    click_button 'Update Hunter backstory'
    expect(page).to have_content 'Hunter backstory was successfully updated.'
    expect(hunter_backstory.reload).to have_attributes(
      hunter_id: hunter_backstory.hunter_id,
      playbook_id: hunter_backstory.playbook_id,
      choices: {
        "How you found out" => ["Some weirdo told you."],
        "Heroic" => ["Sacrifice", "Visions"]
      }
    )
  end
end
