require 'rails_helper'

RSpec.describe "Havens", type: :request do
  describe "GET /havens" do
    it "works! (now write some real specs)" do
      get havens_path
      expect(response).to have_http_status(200)
    end
  end
end
