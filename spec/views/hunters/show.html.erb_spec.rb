require 'rails_helper'

RSpec.describe "hunters/show", type: :view do
  before(:each) do
    @hunter = assign(:hunter, Hunter.create!(playbook: Playbook.create, harm: 0, luck: 7))
  end

  it "renders attributes in <p>" do
    render
  end
end
