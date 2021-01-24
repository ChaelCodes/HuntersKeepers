# frozen_string_literal: true

require 'rails_helper'

describe 'playbooks#show' do
  let(:user) { create :user }
  let!(:playbook) { create :playbook, luck_effect: 'Is lucky' }

  before :each do
    sign_in user
  end

  it 'shows the playbook luck effect' do
    visit "/playbooks/#{playbook.id}".dup
    expect(page).to have_content('Is lucky')
  end
end
