require 'rails_helper'

describe 'gears#index' do
  let!(:gear) { create_list :gear, 3, :with_tags }

  it 'has a list of gears' do
    visit "/gears"
    page.all('thead > tr').each do |row|
      expect(row).to have_content 'Name'
      expect(row).to have_content 'Description'
      expect(row).to have_content 'Harm'
      expect(row).to have_content 'Armor'
      expect(row).to have_content 'Playbook'
    end
    page.all('tbody > tr').each do |row|
      expect(row).to have_content 'Sword'
    end
  end
end
