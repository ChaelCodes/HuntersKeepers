require 'rails_helper'

RSpec.describe "hunter_backstories/edit", type: :view do
  before(:each) do
    @hunter_backstory = assign(:hunter_backstory, HunterBackstory.create!(
      hunter: "",
      playbook: "",
      choices: ""
    ))
  end

  it "renders the edit hunter_backstory form" do
    render

    assert_select "form[action=?][method=?]", hunter_backstory_path(@hunter_backstory), "post" do

      assert_select "input[name=?]", "hunter_backstory[hunter]"

      assert_select "input[name=?]", "hunter_backstory[playbook]"

      assert_select "input[name=?]", "hunter_backstory[choices]"
    end
  end
end
