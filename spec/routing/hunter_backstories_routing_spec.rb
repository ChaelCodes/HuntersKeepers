require "rails_helper"

RSpec.describe HunterBackstoriesController, type: :routing do
  describe "routing" do
    let(:hunter) { create :hunter }

    it "routes to #index" do
      expect(get: "/hunter_backstories").to route_to("hunter_backstories#index")
    end

    it "routes to #new" do
      expect(
        get: "hunters/#{hunter.id}/hunter_backstories/new"
      ).to route_to("hunter_backstories#new", hunter_id: hunter.id.to_s)
    end

    it "routes to #show" do
      expect(get: "/hunter_backstories/1").to route_to("hunter_backstories#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/hunter_backstories/1/edit").to route_to("hunter_backstories#edit", id: "1")
    end


    it "routes to #create" do
      expect(
        post: "hunters/#{hunter.id}/hunter_backstories"
      ).to route_to("hunter_backstories#create", hunter_id: hunter.id.to_s)
    end

    it "routes to #update via PUT" do
      expect(put: "/hunter_backstories/1").to route_to("hunter_backstories#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/hunter_backstories/1").to route_to("hunter_backstories#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/hunter_backstories/1").to route_to("hunter_backstories#destroy", id: "1")
    end
  end
end
