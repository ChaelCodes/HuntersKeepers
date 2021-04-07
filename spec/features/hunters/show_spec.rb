# frozen_string_literal: true

require 'rails_helper'

describe 'hunters#show' do
  let(:user) { create :user }
  let!(:hunter) { create :hunter, user: user, experience: 5, harm: 4 }

  before :each do
    sign_in user
  end

  it 'shows a hunters values' do
    visit "/hunters/#{hunter.id}".dup
    expect(page).to have_content hunter.name
    expect(page).to have_link hunter.playbook.name, href: playbook_path(hunter.playbook)
    expect(page).to have_content hunter.playbook.description
    expect(page).to have_content "Harm: #{hunter.harm}"
    expect(page).to have_content "UNSTABLE"
    expect(page).to have_content "Luck: #{hunter.luck}"
    expect(page).to have_content "Experience: #{hunter.experience}"
    expect(page).to have_link 'Take an Improvement', href: new_hunter_hunters_improvement_path(hunter_id: hunter.id)
  end

  context 'with basic moves' do
    let!(:basic_move) { create(:moves_basic, name: 'The Nameless Move') }

    before { hunter.moves << basic_move }

    it 'lets the user roll basic moves', js: true do
      visit "/hunters/#{hunter.id}".dup
      within('#moves') do
      find('.card-header-title').click
        expect(page).to have_content("(cool #{hunter.cool})")
      end
      expect(page).to have_content(basic_move.name)
    end
  end

  context 'with rollable playbook moves' do
    let!(:moves_rollable) { create(:moves_rollable, name: 'The Rollable Move') }

    before { hunter.moves << moves_rollable }

    it 'uses luck to change the outcome', js: true do
      visit "/hunters/#{hunter.id}".dup
      within('#moves') do
      find('.card-header-title').click
        expect(page).to have_content("(weird #{hunter.weird})")
      end
      expect(Random).to receive(:new).and_return(instance_double('Random', rand: 0))
      find(".card-footer-item").click
      expect(page).to have_content "Your total #{hunter.weird}"
      click_on("Use Luck")
      expect(page).to have_content "Your total #{hunter.weird + 12}"
    end
  end

  describe 'page buttons' do
    let(:have_index_link) { have_link I18n.t('hunters.show.index'), href: hunters_path }
    let(:have_edit_link) { have_link I18n.t('hunters.show.edit'), href: edit_hunter_path(hunter) }
    let(:have_delete_link) { have_link I18n.t('hunters.show.destroy'), href: hunter_path(hunter) }
    let(:visit_page_actions) do
      sign_in user
      visit "/hunters/#{hunter.id}"
    end

    context 'when user is logged in and record belongs to user' do
      before { visit_page_actions }

      it { expect(page).to have_index_link }
      it { expect(page).to have_edit_link }
      it { expect(page).to have_delete_link }
    end

    context 'when user is logged in and record does not belong to user' do
      before do
        hunter.update(user: create(:user))
        visit_page_actions
      end

      it { expect(page).to have_index_link }
      it { expect(page).not_to have_edit_link }
      it { expect(page).not_to have_delete_link }
    end

    context 'when admin is logged in' do
      let(:user) { create :user, :admin }

      before { visit_page_actions }

      it { expect(page).to have_index_link }
      it { expect(page).to have_edit_link }
      it { expect(page).to have_delete_link }
    end
  end
end
