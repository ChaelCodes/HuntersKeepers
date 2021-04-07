# frozen_string_literal: true

require 'rails_helper'

describe 'havens/:id/edit' do
  let(:haven) { create(:haven) }

  describe 'form' do
    let(:admin_user) { create(:user, :admin) }

    before :each do
      sign_in admin_user
      visit "/havens/#{haven.id}/edit"
    end

    it 'renders the edit haven form' do
      expect(page).to have_content 'Editing Haven'
    end
  end

  describe 'delete action' do
    let(:have_delete_link) { have_link I18n.t('havens.show.destroy'), href: haven_path(haven) }

    before :each do
      sign_in user
      visit "/havens/#{haven.id}/edit"
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
