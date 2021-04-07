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

  describe 'delete action' do
    let(:have_delete_link) do
      have_link I18n.t('hunter_backstories.show.destroy'),
                href: hunter_backstory_path(hunter_backstory)
    end

    before :each do
      sign_in user
      visit "/hunter_backstories/#{hunter_backstory.id}/edit"
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
