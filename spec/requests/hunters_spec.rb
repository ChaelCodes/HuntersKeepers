# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Hunters', type: :request, js: true do
  before(:each) do
    sign_in create(:user)
  end

  describe 'GET /hunters' do
    it 'works! (now write some real specs)' do
      get hunters_path
      expect(response).to have_http_status(200)
    end
  end
end
