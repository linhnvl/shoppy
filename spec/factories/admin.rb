FactoryBot.define do
  factory :admin do
    name{Faker::Name.name}
    email{Faker::Internet.email}
    role{%i(system_admin shop_admin).sample}
    password{"Abcd1234"}
  end
end
