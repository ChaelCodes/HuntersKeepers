require "rails_helper"

RSpec.describe GearsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/gears").to route_to("gears#index")
    end

    it "routes to #new" do
      expect(:get => "/gears/new").to route_to("gears#new")
    end

    it "routes to #show" do
      expect(:get => "/gears/1").to route_to("gears#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/gears/1/edit").to route_to("gears#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/gears").to route_to("gears#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/gears/1").to route_to("gears#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/gears/1").to route_to("gears#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/gears/1").to route_to("gears#destroy", :id => "1")
    end
  end
end
