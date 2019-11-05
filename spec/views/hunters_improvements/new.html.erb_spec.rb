# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'hunters_improvements/new', type: :view do
  let(:hunter) { create :hunter }
  let(:hunters_improvement) { build(:hunters_improvement, hunter: hunter) }

  before(:each) do
    controller.extra_params = { hunter_id: hunters_improvement.hunter_id }
    @hunters_improvement = assign(:hunters_improvement, hunters_improvement)
    @improvements = Improvement.all
  end

  it 'renders new hunters_improvement form' do
    render
    url = hunter_hunters_improvements_path(hunter_id: @hunters_improvement.hunter_id)
    assert_select 'form[action=?][method=?]', url, 'post' do
    end
  end
end
