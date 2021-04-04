# frozen_string_literal: true

require 'rails_helper'

describe 'hunters#show' do
  let(:user) { create :user }
  let!(:gear) { create :gear }

  before :each do
    sign_in user
    visit "/gears/#{gear.id}".dup
  end

  it 'informs user about the gear' do
    expect(page).to have_link gear.playbook.name, href: playbook_path(gear.playbook)
    expect(page).to have_content gear.name
    expect(page).to have_content gear.description
    expect(page).to have_content gear.armor
    expect(page).to have_content gear.tag_list
  end

  describe 'page buttons' do
    let(:have_index_link) { have_link I18n.t('gears.show.index'), href: gears_path }
    let(:have_edit_link) { have_link I18n.t('gears.show.edit'), href: edit_gear_path(gear) }
    let(:have_delete_link) { have_link I18n.t('gears.show.destroy'), href: gear_path(gear) }

    before :each do
      sign_in user
      visit "/gears/#{gear.id}".dup
    end

    context 'when user is logged in' do
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
