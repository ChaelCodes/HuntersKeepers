require 'rails_helper'

RSpec.describe "hunters/index", type: :view do
  before(:each) do
    assign(:hunters, [
      Hunter.create!(),
      Hunter.create!()
    ])
  end

  it "renders a list of hunters" do
    render
  end
end
