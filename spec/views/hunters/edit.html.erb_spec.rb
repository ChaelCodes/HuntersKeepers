require 'rails_helper'

RSpec.describe "hunters/edit", type: :view do
  before(:each) do
    @hunter = assign(:hunter, Hunter.create!())
  end

  it "renders the edit hunter form" do
    render

    assert_select "form[action=?][method=?]", hunter_path(@hunter), "post" do
    end
  end
end
