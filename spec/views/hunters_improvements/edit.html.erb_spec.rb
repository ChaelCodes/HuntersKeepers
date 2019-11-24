# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'hunters_improvements/edit', type: :view do
  let(:hunters_improvement) { create(:hunters_improvement) }

  before(:each) do
    controller.extra_params = { hunter_id: hunters_improvement.hunter_id }
    @hunters_improvement = assign(:hunters_improvement, hunters_improvement)
    @improvements = Improvement.all
  end

  it 'renders the edit hunters_improvement form' do
    render
    url = hunter_hunters_improvement_path(hunter_id: @hunters_improvement.hunter_id, id: @hunters_improvement.id)
    assert_select 'form[action=?][method=?]', url, 'post' do
    end
  end
end
