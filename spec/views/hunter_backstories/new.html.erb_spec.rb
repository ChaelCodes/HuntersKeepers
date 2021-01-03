require 'rails_helper'

RSpec.describe "hunter_backstories/new", type: :view do
  before(:each) do
    assign(:hunter_backstory, HunterBackstory.new(
      hunter: "",
      playbook: "",
      choices: ""
    ))
  end

  it "renders new hunter_backstory form" do
    render

    assert_select "form[action=?][method=?]", hunter_backstories_path, "post" do

      assert_select "input[name=?]", "hunter_backstory[hunter]"

      assert_select "input[name=?]", "hunter_backstory[playbook]"

      assert_select "input[name=?]", "hunter_backstory[choices]"
    end
  end
end
