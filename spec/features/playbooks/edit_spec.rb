# frozen_string_literal: true

require 'rails_helper'

describe 'playbooks#edit' do
  let(:user) { create :user, :admin }
  let!(:playbook) { create :playbook, :with_backstory, luck_effect: 'Is lucky' }

  before :each do
    sign_in user
    visit "/playbooks/#{playbook.id}/edit".dup
  end

  it 'edits the playbook' do
    expect(page).to have_content 'Editing Playbook'
    fill_in 'playbook[luck_effect]', with: 'This is a luck effect.'
    heading_name = find_field('', name: 'playbook[backstory][headings][][name]', match: :first)
    heading_name.fill_in with: 'A DIFFERENT NAME'
    heading_count = find_field('', name: 'playbook[backstory][headings][][count]', match: :first)
    heading_count.fill_in with: 2
    click_button 'Update Playbook'
    expect(page).to have_content('Playbook was successfully updated.')
    expect(playbook.reload).to have_attributes(
      luck_effect: 'This is a luck effect.'
    )
    expect(playbook.backstory.headings).to include({name: "A DIFFERENT NAME", count: '2', options: ["Nightmares and visions", "Some weirdo told you."]})
  end

  context 'with regular user' do
    let(:user) { create :user }

    it 'prevents user from accessing edit' do
      expect(page).to have_content 'You are not authorized to perform this action.'
    end
  end

  describe 'delete action' do
    let(:have_delete_link) { have_link I18n.t('playbooks.show.destroy'), href: playbook_path(playbook) }

    before :each do
      sign_in user
      visit "/playbooks/#{playbook.id}/edit"
    end

    context 'when user is logged in' do
      let(:user) { create(:user) }

      it { expect(page).not_to have_delete_link }
    end

    context 'when admin is logged in' do
      let(:user) { create(:user, :admin) }

      it { expect(page).to have_delete_link }
    end
  end
end
