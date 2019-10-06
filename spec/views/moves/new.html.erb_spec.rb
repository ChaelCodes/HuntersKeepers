require 'rails_helper'

RSpec.describe "moves/new", type: :view do
  before(:each) do
    assign(:move, Move.new)
  end

  it "renders new move form" do
    render

    assert_select "form[action=?][method=?]", moves_path, "post" do

      assert_select "input[name=?]", "move[name]"

      assert_select "select[name=?]", "move[rating]"
    end
  end
end
