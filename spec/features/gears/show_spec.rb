# frozen_string_literal: true

require 'rails_helper'

describe 'hunters#show' do
  let(:user) { create :user }
  let!(:gear) { create :gear }

  before :each do
    sign_in user
    visit "/gears/#{gear.id}".dup
  end

  it 'informs user about the gear' do
    expect(page).to have_link gear.playbook.name, href: playbook_path(gear.playbook)
    expect(page).to have_content gear.name
    expect(page).to have_content gear.description
    expect(page).to have_content gear.armor
    expect(page).to have_content gear.tag_list
  end
end
