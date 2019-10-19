# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'moves/edit', type: :view do
  let(:move) { create :move }
  before(:each) do
    @move = assign(:move, move)
  end

  it 'renders the edit move form' do
    render

    assert_select 'form[action=?][method=?]', move_path(@move), 'post' do
      assert_select 'input[name=?]', 'move[name]'

      assert_select 'select[name=?]', 'move[rating]'
    end
  end
end
