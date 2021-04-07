# frozen_string_literal: true

require 'rails_helper'

describe 'move#show' do
  let!(:move) { create :move }

  describe 'page buttons' do
    let(:have_index_link) { have_link I18n.t('moves.show.index'), href: moves_path }
    let(:have_edit_link) { have_link I18n.t('moves.show.edit'), href: edit_move_path(move) }
    let(:have_delete_link) { have_link I18n.t('moves.show.destroy'), href: move_path(move) }

    before :each do
      sign_in user
      visit "/moves/#{move.id}"
    end

    context 'when user is logged in' do
      let(:user) { create :user }

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
