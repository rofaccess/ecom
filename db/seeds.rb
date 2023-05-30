# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create products
ActiveRecord::Base.transaction do
  products = []
  1.times do
    product_name = Faker::Commerce.product_name
    products << Product.new(name: product_name, description: product_name, price: Faker::Commerce.price)
  end
  Product.import products

  clients = []
  1.times do
    clients << Client.new
  end
  result = Client.import clients
  client_ids = result.ids

  people = []
  client_ids.each do |client_id|
    people << Person.new(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        document_number: Faker::Number.number(5),
        address: Faker::Address.street_address,
        phone: Faker::PhoneNumber.cell_phone,
        client_id: client_id
    )
  end
  Person.import people

  sale_orders = []
  client_ids.each do |client_id|
    sale_orders << SaleOrder.new(
        number: Faker::Number.number(5),
        sold_at: Faker::Time.between(2.days.ago, Time.now, :all),
        client_id: client_id
    )
  end
  SaleOrder.import sale_orders
end
