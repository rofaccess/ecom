FactoryBot.define do
  factory :sale_order_product do
    sale_order_id { 1 }
    product_id { 1 }
    quantity { "" }
    price { "9.99" }
  end
end
