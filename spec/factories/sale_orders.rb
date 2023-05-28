FactoryBot.define do
  factory :sale_order do
    number { Faker::Number.number(5) }
    sold_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    client_id { 1 }
  end
end
