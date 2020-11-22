require 'rails_helper'

describe 'hunters#index' do
  let!(:hunters) { create_list :hunter, 3, name: 'Buffy' }
  let(:user) { create :user }

  before do
    sign_in user
  end

  it 'has a list of hunters' do
    visit "/hunters"
    page.all('thead > tr').each do |row|
      expect(row).to have_content 'Name'
      expect(row).to have_content 'Playbook'
      expect(row).to have_content 'Harm'
      expect(row).to have_content 'Luck'
      expect(row).to have_content 'Exp'
    end
    page.all('tbody > tr').each do |row|
      expect(row).to have_content 'Buffy'
    end
  end
end
