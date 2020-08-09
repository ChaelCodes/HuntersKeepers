# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'havens/index', type: :view do
  before(:each) do
    assign(:havens,
           create_list(:haven, 2, name: 'Name', description: 'Description'))
  end

  it 'renders a list of havens' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Description'.to_s, count: 2
  end
end
