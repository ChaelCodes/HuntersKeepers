require 'rails_helper'

RSpec.describe "hunter_backstories/show", type: :view do
  before(:each) do
    @hunter_backstory = assign(:hunter_backstory, HunterBackstory.create!(
      hunter: "",
      playbook: "",
      choices: ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
