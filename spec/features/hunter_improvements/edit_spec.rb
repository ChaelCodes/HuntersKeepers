# frozen_string_literal: true

require 'rails_helper'

describe 'hunters/:id/hunters_improvements/:id/edit' do
  let(:hunters_improvement) { create(:hunters_improvement) }
  let(:hunter) { hunters_improvement.hunter }

  describe 'delete action' do
    let(:have_delete_link) do
      have_link I18n.t('hunters_improvements.show.destroy'),
                href: hunter_hunters_improvement_path(hunter_id: hunter.id,
                                                      id: hunters_improvement.id)
    end

    before :each do
      sign_in user
      visit "hunters/#{hunter.id}/hunters_improvements/#{hunters_improvement.id}/edit"
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
