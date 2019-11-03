require 'rails_helper'

RSpec.describe "improvements/index", type: :view do
  let(:improvements) { create_list(:improvement, 2) }
  before(:each) do
    assign(:improvements, improvements)
  end

  it "renders a list of improvements" do
    render
    improvements.pluck(:description).each do |description|
      assert_select "tr>td", text: description
    end
    improvements.pluck(:rating).each do |rating|
      assert_select "tr>td", text: rating
    end
    improvements.pluck(:stat_limit).each do |stat_limit|
      assert_select "tr>td", text: stat_limit.to_s
    end
  end
end
