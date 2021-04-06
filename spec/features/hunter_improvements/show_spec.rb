# frozen_string_literal: true

require 'rails_helper'

describe 'hunter_improvements#show' do
  let(:hunters_improvement) { create(:hunters_improvement) }
  let(:hunter) { hunters_improvement.hunter }

  describe 'page buttons' do
    let(:have_index_link) do
      have_link I18n.t('hunters_improvements.show.index'),
                href: hunter_hunters_improvements_path(hunter.id)
    end
    let(:have_edit_link) do
      have_link I18n.t('hunters_improvements.show.edit'),
                href: edit_hunter_hunters_improvement_path(hunter_id: hunter.id,
                                                           id: hunters_improvement.id)
    end
    let(:have_delete_link) do
      have_link I18n.t('hunters_improvements.show.destroy'),
                href: hunter_hunters_improvement_path(hunter_id: hunter.id,
                                                      id: hunters_improvement.id)
    end

    before :each do
      sign_in user
      visit "/hunters/#{hunter.id}/hunters_improvements/#{hunters_improvement.id}".dup
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
