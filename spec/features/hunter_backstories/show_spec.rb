# frozen_string_literal: true

require 'rails_helper'

describe 'hunter_backstories/:id' do
  let(:user) { create :user }
  let(:hunter_backstory) { create :hunter_backstory }

  before :each do
    sign_in user
  end

  it 'shows a hunter backstory' do
    visit "/hunter_backstories/#{hunter_backstory.id}".dup
    binding.pry
    expect(page).to have_content 'Hunter'
  end
end
