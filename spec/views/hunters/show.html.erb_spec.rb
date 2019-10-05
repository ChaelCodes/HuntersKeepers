require 'rails_helper'

RSpec.describe "hunters/show", type: :view do
  let(:hunter) { create(:hunter) }

  before(:each) do
    @hunter = assign(:hunter, hunter)
  end

  it "renders attributes in <p>" do
    render
  end
end
