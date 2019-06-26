FactoryBot.define do
  factory :user do
    name{Faker::Name.name}
    email{Faker::Internet.email}
    password_digest{Faker::Lorem.characters(8)}
    address{Faker::Address.city}
    phone_number{Faker::PhoneNumber.phone_number}
  end
end
