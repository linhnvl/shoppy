FactoryBot.define do
  factory :admin do
    name{Faker::Name.name}
    email{Faker::Internet.email}
    role{%i(system_admin shop_admin).sample}
    password_digest{Faker::Lorem.characters(8)}
  end
end
