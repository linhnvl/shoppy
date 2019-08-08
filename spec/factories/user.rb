FactoryBot.define do
  factory :user do
    name{Faker::Name.name}
    email{Faker::Internet.email}
    password{"Abcd1234"}
    address{Faker::Address.city}
    phoneNumber{Faker::PhoneNumber.phone_number}
    city{Faker::Address.city}
    country{Faker::Address.country}
    postalCode{Faker::Address.postcode}
  end
end
