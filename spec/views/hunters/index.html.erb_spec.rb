# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'hunters/index', type: :view do
  let(:user) { create :user }
  let(:hunters) { create_list(:hunter, 2) }

  before do
    assign(:hunters, hunters)
    enable_pundit(view, user)
  end

  it 'renders a list of hunters' do
    render
  end

  describe 'User has created hunter' do
    let(:hunters) { [create(:hunter, user: user)] }

    it 'shows edit' do
      render
      expect(rendered).to match(/Edit/)
        .and match(/Destroy/)
    end
  end

  describe 'User has not created hunter' do
    let(:creator) { create :user }
    let(:hunters) { [create(:hunter, user: creator)] }

    it 'shows edit' do
      render
      expect(rendered).not_to match(/Edit/)
      expect(rendered).not_to match(/Destroy/)
    end
  end
end
