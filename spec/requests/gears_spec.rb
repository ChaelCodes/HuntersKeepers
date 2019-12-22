require 'rails_helper'

RSpec.describe "Gears", type: :request do
  before(:each) do
    sign_in create(:user)
  end

  describe "GET /gears" do
    it "works! (now write some real specs)" do
      get gears_path
      expect(response).to have_http_status(200)
    end
  end
end
