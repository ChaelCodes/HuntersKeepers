# frozen_string_literal: true

require 'rails_helper'

describe 'improvements/:id/edit' do
  let(:improvement) { create(:improvement) }

  describe 'delete action' do
    let(:have_delete_link) do
      have_link I18n.t('improvements.show.destroy'), href: improvement_path(improvement) 
    end

    before :each do
      sign_in user
      visit "/improvements/#{improvement.id}/edit"
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
