require 'rails_helper'

RSpec.describe "HuntersImprovements", type: :request do
  let(:hunter) { create :hunter }

  describe "GET /hunters_improvements" do
    it "works! (now write some real specs)" do
      get hunter_hunters_improvements_path(hunter_id: hunter.id)
      expect(response).to have_http_status(200)
    end
  end
end
