require "rails_helper"

RSpec.describe TwitterCallsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/twitter_calls").to route_to("twitter_calls#index")
    end

    it "routes to #new" do
      expect(:get => "/twitter_calls/new").to route_to("twitter_calls#new")
    end

    it "routes to #show" do
      expect(:get => "/twitter_calls/1").to route_to("twitter_calls#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/twitter_calls/1/edit").to route_to("twitter_calls#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/twitter_calls").to route_to("twitter_calls#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/twitter_calls/1").to route_to("twitter_calls#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/twitter_calls/1").to route_to("twitter_calls#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/twitter_calls/1").to route_to("twitter_calls#destroy", :id => "1")
    end

  end
end
