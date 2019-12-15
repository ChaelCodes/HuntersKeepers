require 'rails_helper'

RSpec.describe "gears/new", type: :view do
  before(:each) do
    assign(:gear, create(:gear))
  end

  it "renders new gear form" do
    render

    assert_select "form" do

      assert_select "input[name=?]", "gear[name]"

      assert_select "input[name=?]", "gear[description]"

      assert_select "input[name=?]", "gear[harm]"

      assert_select "input[name=?]", "gear[armor]"

      assert_select "select[name=?]", "gear[playbook_id]"
    end
  end
end
