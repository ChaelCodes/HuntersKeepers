require 'rails_helper'

RSpec.describe "Hunters", type: :request do
  describe "GET /hunters" do
    it "works! (now write some real specs)" do
      get hunters_path
      expect(response).to have_http_status(200)
    end
  end
end
