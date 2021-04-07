# frozen_string_literal: true

require 'rails_helper'

describe 'haven#show' do
  let(:haven) { create(:haven) }

  describe 'page buttons' do
    let(:have_index_link) { have_link I18n.t('havens.show.index'), href: havens_path }
    let(:have_edit_link) { have_link I18n.t('havens.show.edit'), href: edit_haven_path(haven) }
    let(:have_delete_link) { have_link I18n.t('havens.show.destroy'), href: haven_path(haven) }

    before :each do
      sign_in user
      visit "/havens/#{haven.id}".dup
    end

    context 'when user is logged in' do
      let(:user) { create(:user) }

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
