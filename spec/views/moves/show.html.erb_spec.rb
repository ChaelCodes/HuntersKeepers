# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'moves/show', type: :view do
  let(:move) { create :move, rating: :cool }

  before do
    @move = assign(:move, move)
    @user = create(:user)
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/cool/)
  end
end
