# frozen_string_literal: true

require 'rails_helper'

describe 'gears/:id/edit' do
  let(:gear) { create(:gear) }

  describe 'form' do
    let(:admin_user) { create(:user, :admin) }

    before :each do
      sign_in admin_user
      visit "/gears/#{gear.id}/edit"
    end

    it 'renders the edit gear form' do
      expect(page).to have_content 'Editing Gear'
    end
  end

  describe 'delete action' do
    let(:have_delete_link) { have_link I18n.t('gears.show.destroy'), href: gear_path(gear) }

    before :each do
      sign_in user
      visit "/gears/#{gear.id}/edit"
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
