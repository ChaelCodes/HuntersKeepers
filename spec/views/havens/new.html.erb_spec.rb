# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'havens/new', type: :view do
  before(:each) do
    assign(:haven, Haven.new)
  end

  it 'renders new haven form' do
    render

    assert_select 'form[action=?][method=?]', havens_path, 'post' do
      assert_select 'input[name=?]', 'haven[name]'

      assert_select 'textarea[name=?]', 'haven[description]'
    end
  end
end
