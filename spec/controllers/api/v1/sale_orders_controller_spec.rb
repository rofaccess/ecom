# From
# - https://nimblehq.co/blog/testing-rails-json-api-with-rspec
require 'rails_helper'

RSpec.describe Api::V1::SaleOrdersController, :type => :controller do
  fixtures :people, :clients, :sale_orders

  let(:valid_attributes) {
    {
        number: Faker::Number.number(5),
        sold_at: Faker::Time.between(2.days.ago, Time.now, :all),
        client_id: clients(:client).id
    }
  }

  let(:invalid_attributes) {
    valid_attributes.except(:sold_at)
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SaleOrdersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    before { get :index, {}, valid_session }

    it "returns correct json format" do
      expect(response).to match_response_schema("sale_orders")
    end

    it "returns all sale orders" do
      expect(json.size).to eq(SaleOrder.count)
    end

    it "returns a success response" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      before { post :create, {sale_order: valid_attributes}, valid_session }

      it "returns correct json format" do
        expect(response).to match_response_schema("sale_order")
      end

      it "returns status code 201" do
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid params" do
      before { post :create, {sale_order: invalid_attributes}, valid_session }

      it "returns error message" do
        expect(response).to match_response_schema("errors")
      end

      it "returns error message" do
        expect(json["errors"]).to eq("Sold at can't be blank")
      end

      it "returns error code" do
        expect(json["code"]).to eq("validation_error")
      end

      it "returns status code 422" do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

end
