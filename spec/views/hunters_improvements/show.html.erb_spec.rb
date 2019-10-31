require 'rails_helper'

RSpec.describe "hunters_improvements/show", type: :view do
  let(:hunters_improvement) { create(:hunters_improvement) }

  before(:each) do
    controller.extra_params = { hunter_id: hunters_improvement.hunter_id }
    @hunters_improvement = assign(:hunters_improvement, hunters_improvement)
  end

  it "renders attributes in <p>" do
    render
  end
end
