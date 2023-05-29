class SaleOrderSerializer < ActiveModel::Serializer
  attributes :id, :number, :sold_at, :client_id
end
