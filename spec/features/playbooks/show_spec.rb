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

  describe 'page buttons' do
    let(:have_index_link) { have_link I18n.t('playbooks.show.index'), href: playbooks_path }
    let(:have_edit_link) { have_link I18n.t('playbooks.show.edit'), href: edit_playbook_path(playbook) }
    let(:have_delete_link) { have_link I18n.t('playbooks.show.destroy'), href: playbook_path(playbook) }

    before :each do
      sign_in user
      visit "/playbooks/#{playbook.id}".dup
    end

    context 'when user is logged in' do
      it { expect(page).to have_index_link }
      it { expect(page).not_to have_edit_link }
      it { expect(page).not_to have_delete_link }
    end

    context 'when admin is logged in' do
      let(:user) { create :user, :admin }

      it { expect(page).to have_index_link }
      it { expect(page).to have_edit_link }
      it { expect(page).to have_delete_link }
    end
  end
end
