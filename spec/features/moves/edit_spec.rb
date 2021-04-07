# frozen_string_literal: true

require 'rails_helper'

describe 'moves/:id/edit' do
  let(:move) { create(:move) }

  describe 'delete action' do
    let(:have_delete_link) { have_link I18n.t('moves.show.destroy'), href: move_path(move) }

    before :each do
      sign_in user
      visit "/moves/#{move.id}/edit"
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
