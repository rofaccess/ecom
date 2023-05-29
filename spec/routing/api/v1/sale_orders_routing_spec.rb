require "rails_helper"

RSpec.describe Api::V1::SaleOrdersController, :type => :routing do
  describe "routing" do
    it "routes to #index" do
      # Obs.: Es necesario agregar format: "json" porque en la definición de la ruta se definió que por defecto
      # se recibe json
      expect(:get => "api/sale_orders").to route_to("api/v1/sale_orders#index", format: "json")
    end

    it "routes to #create" do
      expect(:post => "api/sale_orders").to route_to("api/v1/sale_orders#create", format: "json")
    end
  end
end
