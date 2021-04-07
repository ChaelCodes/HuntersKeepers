# frozen_string_literal: true

require 'rails_helper'

describe 'rating#show' do
  let!(:rating) { create :rating }

  describe 'page buttons' do
    let(:have_index_link) { have_link I18n.t('ratings.show.index'), href: ratings_path }
    let(:have_edit_link) { have_link I18n.t('ratings.show.edit'), href: edit_rating_path(rating) }
    let(:have_delete_link) { have_link I18n.t('ratings.show.destroy'), href: rating_path(rating) }

    before :each do
      sign_in user
      visit "/ratings/#{rating.id}"
    end

    context 'when user is logged in' do
      let(:user)  { create :user }

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
