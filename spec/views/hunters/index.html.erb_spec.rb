require 'rails_helper'

RSpec.describe "hunters/index", type: :view do
  before(:each) do
    assign(:hunters, [
      Hunter.create!(playbook: Playbook.create, harm: 0, luck: 7),
      Hunter.create!(playbook: Playbook.create, harm: 0, luck: 7)
    ])
  end

  it "renders a list of hunters" do
    render
  end
end
