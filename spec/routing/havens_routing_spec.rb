require "rails_helper"

RSpec.describe HavensController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/havens").to route_to("havens#index")
    end

    it "routes to #new" do
      expect(:get => "/havens/new").to route_to("havens#new")
    end

    it "routes to #show" do
      expect(:get => "/havens/1").to route_to("havens#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/havens/1/edit").to route_to("havens#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/havens").to route_to("havens#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/havens/1").to route_to("havens#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/havens/1").to route_to("havens#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/havens/1").to route_to("havens#destroy", :id => "1")
    end
  end
end
