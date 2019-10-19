# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'hunters/new', type: :view do
  before(:each) do
    assign(:hunter, Hunter.new)
  end

  it 'renders new hunter form' do
    render

    assert_select 'form[action=?][method=?]', hunters_path, 'post' do
    end
  end
end
