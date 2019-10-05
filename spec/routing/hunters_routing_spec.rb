require "rails_helper"

RSpec.describe HuntersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/hunters").to route_to("hunters#index")
    end

    it "routes to #new" do
      expect(:get => "/hunters/new").to route_to("hunters#new")
    end

    it "routes to #show" do
      expect(:get => "/hunters/1").to route_to("hunters#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/hunters/1/edit").to route_to("hunters#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/hunters").to route_to("hunters#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/hunters/1").to route_to("hunters#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/hunters/1").to route_to("hunters#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/hunters/1").to route_to("hunters#destroy", :id => "1")
    end
  end
end
