FactoryBot.define do
  factory :user do
    name{Faker::Name.name}
    email{Faker::Internet.email}
    password{"Abcd1234"}
    address{Faker::Address.city}
    phone_number{Faker::PhoneNumber.phone_number}
  end
end
