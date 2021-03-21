# frozen_string_literal: true

require 'rails_helper'

describe 'hunters/:id/hunter_backstories/new' do
  let(:user) { create :user }
  let(:hunter) { create :hunter, user: user, playbook: playbook }
  let(:playbook) { create :playbook, :with_backstory }

  before :each do
    sign_in user
  end

  subject { visit "/hunters/#{hunter.id}/hunter_backstories/new".dup }

  it 'creates a hunter backstory' do
    subject
    expect(page).to have_content 'New Hunter'
    select('Some weirdo told you', from: "hunter_backstory[choices][How you found out][]")
    # TODO Handle multiple selections
    page.find_by_id('hunter_backstory_choice_Heroic_0').find("option[value='Sacrifice']").select_option
    page.find_by_id('hunter_backstory_choice_Heroic_1').find("option[value='Visions']").select_option
    click_button 'Create Hunter backstory'
    expect(page).to have_content('Hunter backstory was successfully created.')
    expect(HunterBackstory.last).to have_attributes(
      hunter_id: hunter.id,
      playbook_id: playbook.id,
      choices: {
        "How you found out" => ["Some weirdo told you."],
        "Heroic" => ["Sacrifice", "Visions"]
      }
    )
  end

  it 'back leaves the page' do
    subject
    click_link 'Back'
    expect(page).to have_content 'Hunter Backstories'
  end
end
