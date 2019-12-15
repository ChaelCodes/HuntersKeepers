require 'rails_helper'

RSpec.describe "gears/index", type: :view do
  before(:each) do
    assign(:gears, create_list(:gear, 2))
  end

  it "renders a list of gears" do
    render
    assert_select 'tr>td', text: 'Sword', :count => 2
    assert_select 'tr>td', text: 'Silver sword', :count => 2
    assert_select 'tr>td', text: 2.to_s, :count => 2
    assert_select 'tr>td', text: 1.to_s, :count => 2
  end
end
