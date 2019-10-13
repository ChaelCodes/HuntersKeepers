require 'rails_helper'

RSpec.describe "moves/show", type: :view do
  let(:move) { create :move }

  before(:each) do
    @move = assign(:move, move)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/cool/)
  end
end
