require 'rails_helper'

RSpec.describe "improvements/edit", type: :view do
  let(:improvement) { create :improvement }

  before(:each) do
    @improvement = assign(:improvement, improvement)
  end

  it "renders the edit improvement form" do
    render

    assert_select "form[action=?][method=?]", improvement_path(@improvement), "post" do

    assert_select "select[name=?]", 'improvement[playbook_id]'

    assert_select "input[name=?]", "improvement[description]"

    assert_select "select[name=?]", "improvement[type]"

    assert_select "input[name=?]", "improvement[move_id]"

    assert_select "select[name=?]", "improvement[rating]"

    assert_select "input[name=?]", "improvement[stat_limit]"
    end
  end
end
