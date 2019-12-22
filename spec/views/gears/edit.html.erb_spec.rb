require 'rails_helper'

RSpec.describe "gears/edit", type: :view do
  before(:each) do
    @gear = assign(:gear, create(:gear))
  end

  it "renders the edit gear form" do
    render

    assert_select "form[action=?][method=?]", gear_path(@gear), "post" do

      assert_select "input[name=?]", "gear[name]"

      assert_select "input[name=?]", "gear[description]"

      assert_select "input[name=?]", "gear[harm]"

      assert_select "input[name=?]", "gear[armor]"

      assert_select "select[name=?]", "gear[playbook_id]"
    end
  end
end
