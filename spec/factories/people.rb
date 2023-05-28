FactoryBot.define do
  factory :person do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    document_number { Faker::Number.number(10) }
    address { Faker::Address.street_address }
    phone { Faker::PhoneNumber.cell_phone }
  end
end
