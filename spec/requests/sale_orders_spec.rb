require 'rails_helper'

RSpec.describe "SaleOrders", :type => :request do
  describe "GET /sale_orders" do
    it "works! (now write some real specs)" do
      get sale_orders_path
      expect(response).to have_http_status(200)
    end
  end
end
