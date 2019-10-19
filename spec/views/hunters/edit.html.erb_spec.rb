# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'hunters/edit', type: :view do
  let(:hunter) { create(:hunter) }

  before(:each) do
    @hunter = assign(:hunter, hunter)
  end

  it 'renders the edit hunter form' do
    render

    assert_select 'form[action=?][method=?]', hunter_path(@hunter), 'post' do
    end
  end
end
