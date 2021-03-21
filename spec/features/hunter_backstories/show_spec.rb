# frozen_string_literal: true

require 'rails_helper'

describe 'hunter_backstories/:id' do
  let(:user) { create :user }
  let(:hunter_backstory) { create :hunter_backstory }

  before :each do
    sign_in user
  end

  subject { visit "/hunter_backstories/#{hunter_backstory.id}".dup }

  it 'shows a hunter backstory' do
    subject
    expect(page).to have_content hunter_backstory.hunter.name
    expect(page).to have_content hunter_backstory.playbook.name
    expect(page).to have_content 'Some weirdo told you'
    expect(page).to have_content 'How you found out'
  end

  context 'when user has hunter for backstory' do
    let(:user) { hunter_backstory.hunter.user }

    it 'takes you to the edit form' do
      subject
      click_link 'Edit'
      expect(page).to have_content 'Editing Hunter Backstory'
    end
  end

  it 'back leaves the page' do
    subject
    click_link 'Back'
    expect(page).to have_content 'Hunter Backstories'
  end
end
