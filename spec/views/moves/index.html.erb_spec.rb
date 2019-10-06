require 'rails_helper'

RSpec.describe "moves/index", type: :view do
  before(:each) do
    assign(:moves, create_list(:move, 2))
  end

  it "renders a list of moves" do
    render
    assert_select "tr>td", :text => "Act Under Pressure", :count => 2
    assert_select "tr>td", :text => 'cool', :count => 2
  end
end
