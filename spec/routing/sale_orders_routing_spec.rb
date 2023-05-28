require "rails_helper"

RSpec.describe SaleOrdersController, :type => :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/sale_orders").to route_to("sale_orders#index")
    end

    it "routes to #create" do
      expect(:post => "/sale_orders").to route_to("sale_orders#create")
    end
  end
end
