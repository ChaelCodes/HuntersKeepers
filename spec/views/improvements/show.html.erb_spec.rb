# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'improvements/show', type: :view do
  before(:each) do
    @improvement = assign(:improvement, create(:improvement))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/#{@improvement.description}/)
    expect(rendered).to match(/#{@improvement.type}/)
    expect(rendered).to match(/#{@improvement.rating}/)
    expect(rendered).to match(/#{@improvement.stat_limit}/)
  end
end
