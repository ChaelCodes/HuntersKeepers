require 'rails_helper'

RSpec.describe "hunter_backstories/index", type: :view do
  before(:each) do
    assign(:hunter_backstories, [
      HunterBackstory.create!(
        hunter: "",
        playbook: "",
        choices: ""
      ),
      HunterBackstory.create!(
        hunter: "",
        playbook: "",
        choices: ""
      )
    ])
  end

  it "renders a list of hunter_backstories" do
    render
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
