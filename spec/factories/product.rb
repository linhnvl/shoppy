FactoryBot.define do
  factory :product do
    name{Faker::Name.name}
    price{Faker::Number.decimal(2)}
    information{Faker::Lorem.paragraph}
    quantity{Faker::Number.number(4)}
  end
end
