require "rails_helper"

RSpec.describe HuntersImprovementsController, type: :routing do
  let(:hunter) { create :hunter }

  describe "routing" do
    it "routes to #index" do
      expect(:get => "/hunters/#{hunter.id}/hunters_improvements").to route_to(controller: 'hunters_improvements', action: 'index', hunter_id: hunter.id.to_s)
    end

    it "routes to #new" do
      expect(:get => "/hunters/#{hunter.id}/hunters_improvements/new").to route_to('hunters_improvements#new', hunter_id: hunter.id.to_s)
    end

    it "routes to #show" do
      expect(:get => "/hunters/#{hunter.id}/hunters_improvements/1").to route_to('hunters_improvements#show', id: '1', hunter_id: hunter.id.to_s)
    end

    it "routes to #edit" do
      expect(:get => "/hunters/#{hunter.id}/hunters_improvements/1/edit").to route_to('hunters_improvements#edit', id: '1', hunter_id: hunter.id.to_s)
    end


    it "routes to #create" do
      expect(:post => "/hunters/#{hunter.id}/hunters_improvements").to route_to('hunters_improvements#create', hunter_id: hunter.id.to_s)
    end

    it "routes to #update via PUT" do
      expect(:put => "/hunters/#{hunter.id}/hunters_improvements/1").to route_to('hunters_improvements#update', :id => '1', hunter_id: hunter.id.to_s)
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/hunters/#{hunter.id}/hunters_improvements/1").to route_to('hunters_improvements#update', :id => '1', hunter_id: hunter.id.to_s)
    end

    it "routes to #destroy" do
      expect(:delete => "/hunters/#{hunter.id}/hunters_improvements/1").to route_to('hunters_improvements#destroy', :id => '1', hunter_id: hunter.id.to_s)
    end
  end
end
