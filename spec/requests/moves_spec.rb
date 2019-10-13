require 'rails_helper'

RSpec.describe "Moves", type: :request do
  describe "GET /moves" do
    it "works! (now write some real specs)" do
      get moves_path
      expect(response).to have_http_status(200)
    end
  end
end
