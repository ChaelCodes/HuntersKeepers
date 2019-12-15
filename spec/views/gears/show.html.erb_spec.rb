require 'rails_helper'

RSpec.describe "gears/show", type: :view do
  before(:each) do
    @gear = assign(:gear, create(:gear))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Sword/)
    expect(rendered).to match(/Silver sword/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
  end
end
