# frozen_string_literal: true

require 'rails_helper'

describe 'hunter_backstories' do
  let(:user) { create :user }
  let(:hunter_backstory) { create :hunter_backstory }

  before :each do
    sign_in user
  end

  it 'creates a hunter backstory' do
    visit "/hunter_backstories".dup
    expect(page).to have_content 'Hunter Backstories'
  end
end
