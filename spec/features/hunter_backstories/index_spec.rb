# frozen_string_literal: true

require 'rails_helper'

describe 'hunter_backstories' do
  let(:user) { create :user }
  let(:hunter_backstory) { create :hunter_backstory }

  before :each do
    sign_in user
  end

  subject { visit "/hunter_backstories".dup }

  it 'shows all hunter backstories' do
    subject
    expect(page).to have_content 'Hunter Backstories'
  end

  context 'with hunter backstories' do
    let!(:hunter_backstory) { create(:hunter_backstory) }

    it 'displays hunter_backstories' do
      subject
      expect(page).to have_content hunter_backstory.id
      expect(page).to have_content hunter_backstory.hunter.name
      expect(page).to have_content hunter_backstory.playbook.name
      expect(page).not_to have_content 'Edit'
      expect(page).not_to have_content 'Destroy'
    end

    context 'with admin' do
      let (:user) { create :user, :admin }

      it 'permits editing' do
        subject
        click_link 'Edit'
        expect(page).to have_content 'Editing Hunter'
      end

      it 'permits deleting' do
        subject
        expect { click_link 'Destroy' }.to change(HunterBackstory, :count).by(-1)
      end
    end
  end
end
