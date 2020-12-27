# frozen_string_literal: true

require 'rails_helper'

describe 'hunter_backstories/:id/edit' do
  let(:user) { create :user }
  let(:hunter_backstory) { create :hunter_backstory }

  before :each do
    sign_in user
  end

  it 'edits a hunter backstory' do
    visit "/hunter_backstories/#{hunter_backstory.id}/edit".dup
    expect(page).to have_content 'Edit Hunter'
  end
end
