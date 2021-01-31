require 'rails_helper'

describe 'playbooks#index' do
  let(:user) { create :user }

  before do
    sign_in user
  end

  context 'with a playbooks' do
    let!(:playbooks) { create :playbook, name: 'The Nameless' }

    it 'has a list of playbooks' do
      visit '/playbooks'
      page.all('thead > tr').each do |row|
        expect(row).to have_content 'Name'
        expect(row).to have_content 'Description'
      end
      expect(page).to have_content 'The Nameless'
      expect(page).not_to have_content('Destroy')
    end
  end

  context 'when admin' do
    let(:user) { create :user, :admin }
    let(:playbook) { create :playbook }

    it 'deletes the selected playbook' do
      Playbook.delete_all
      playbook
      visit '/playbooks'
      expect { click_link 'Destroy' }.to change(Playbook, :count).by(-1)
      expect { playbook.reload }.to raise_error(ActiveRecord::RecordNotFound)
      expect(page).to have_content('Playbook was successfully destroyed.')
    end
  end
end
