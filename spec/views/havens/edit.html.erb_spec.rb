# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'havens/edit', type: :view do
  let(:haven) { create :haven }

  before(:each) do
    assign(:haven, haven)
  end

  it 'renders the edit haven form' do
    render

    assert_select 'form[action=?][method=?]', haven_path(haven), 'post' do
      assert_select 'input[name=?]', 'haven[name]'

      assert_select 'textarea[name=?]', 'haven[description]'
    end
  end
end
