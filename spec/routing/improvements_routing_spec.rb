require "rails_helper"

RSpec.describe ImprovementsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/improvements").to route_to("improvements#index")
    end

    it "routes to #new" do
      expect(:get => "/improvements/new").to route_to("improvements#new")
    end

    it "routes to #show" do
      expect(:get => "/improvements/1").to route_to("improvements#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/improvements/1/edit").to route_to("improvements#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/improvements").to route_to("improvements#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/improvements/1").to route_to("improvements#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/improvements/1").to route_to("improvements#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/improvements/1").to route_to("improvements#destroy", :id => "1")
    end
  end
end
