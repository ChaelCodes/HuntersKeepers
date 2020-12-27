# frozen_string_literal: true

require 'rails_helper'

describe 'hunters/:id/hunter_backstories/new' do
  let(:user) { create :user }
  let(:hunter) { create :hunter, user: user, playbook: playbook }
  let(:playbook) { create :playbook }

  before :each do
    sign_in user
  end

  it 'creates a hunter backstory' do
    visit "/hunters/#{hunter.id}/hunter_backstories/new".dup
    expect(page).to have_content 'New Hunter'
  end
end
