# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'hunters/index', type: :view do
  before(:each) do
    assign(:hunters, create_list(:hunter, 2))
  end

  it 'renders a list of hunters' do
    render
  end
end
