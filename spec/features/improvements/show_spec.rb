# frozen_string_literal: true

require 'rails_helper'

describe 'improvement#show' do
  let(:improvement) { create :improvement }

  describe 'page buttons' do
    let(:have_index_link) { have_link I18n.t('improvements.show.index'), href: improvements_path }
    let(:have_edit_link) { have_link I18n.t('improvements.show.edit'), href: edit_improvement_path(improvement) }
    let(:have_delete_link) { have_link I18n.t('improvements.show.destroy'), href: improvement_path(improvement) }

    before :each do
      sign_in user
      visit "/improvements/#{improvement.id}"
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
