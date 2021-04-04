require 'rails_helper'

describe 'playbooks#index' do
  let(:user) { create :user }

  before do
    sign_in user
  end

  context 'with a playbook' do
    let!(:playbook) { create :playbook, name: 'The Nameless' }

    it 'has a list of playbooks' do
      visit '/playbooks'
      page.all('thead > tr').each do |row|
        expect(row).to have_content 'Name'
        expect(row).to have_content 'Description'
      end
      expect(page).to have_content 'The Nameless'
      expect(page).not_to have_content('Destroy')
    end

    it 'the name takes me to the show page' do
      visit '/playbooks'
      expect(page).to have_link 'The Nameless', href: "/playbooks/#{playbook.id}"
      click_on 'The Nameless'
      expect(page).to have_current_path "/playbooks/#{playbook.id}"
    end
  end

  context 'playbook with a backstory' do
    let!(:playbook) { create :playbook, :with_backstory, name: 'Historical' }

    it 'has a list of playbooks' do
      visit '/playbooks'
      page.all('thead > tr').each do |row|
        expect(row).to have_content 'Name'
        expect(row).to have_content 'Description'
      end
      expect(page).to have_content 'Historical'
      expect(page).not_to have_content('Destroy')
    end
  end
end
