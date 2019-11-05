# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'hunters_improvements/index', type: :view do
  let(:hunter) { create :hunter }

  before(:each) do
    controller.extra_params = { hunter_id: hunter.id }
    assign(:hunters_improvements, create_list(:hunters_improvement, 2))
    assign(:hunter, hunter)
  end

  it 'renders a list of hunters_improvements' do
    render
  end
end
