class SaleOrderProduct < ActiveRecord::Base
  belongs_to :sale_order
  belongs_to :product

  attr_accessible :price, :product_id, :quantity, :sale_order_id
end
