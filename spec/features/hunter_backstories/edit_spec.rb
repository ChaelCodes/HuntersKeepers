# frozen_string_literal: true

require 'rails_helper'

describe 'hunter_backstories/:id/edit' do
  let(:user) { hunter_backstory.hunter.user }
  let(:hunter_backstory) { create :hunter_backstory, :with_choices }

  before :each do
    sign_in user
  end

  it 'edits a hunter backstory' do
    visit "/hunter_backstories/#{hunter_backstory.id}/edit".dup
    expect(page).to have_content 'Editing Hunter'
    click_button 'Update Hunter backstory'
    expect(page).to have_content 'Hunter backstory was successfully updated.'
  end
end
