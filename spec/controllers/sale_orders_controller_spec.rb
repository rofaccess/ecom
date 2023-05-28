# From
# - https://nimblehq.co/blog/testing-rails-json-api-with-rspec
# - https://blog.devgenius.io/testing-a-rails-api-with-rspec-82dedc9f15df
require 'rails_helper'

RSpec.describe SaleOrdersController, :type => :controller do
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

    it "returns all sale orders" do
      expect(json.size).to eq(SaleOrder.count)
    end

    it "returns a success response" do
      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      before { post :create, {sale_order: valid_attributes}, valid_session }

      it "returns the number" do
        expect(json["sale_order"]["number"]).to eq(valid_attributes[:number].to_i)
      end

      it "returns the sold_at" do
        pending "fix date compare"
        expect(json["sale_order"]["sold_at"]).to eq(valid_attributes[:sold_at])
      end

      it "returns the client_id" do
        expect(json["sale_order"]["client_id"]).to eq(valid_attributes[:client_id])
      end

      it "returns status code 201" do
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid params" do
      before { post :create, {sale_order: invalid_attributes}, valid_session }

      it "returns error message" do
        expect(response.body).to eq("Sold at can't be blank")
      end

      it "returns status code 422" do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

end
