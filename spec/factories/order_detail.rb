FactoryBot.define do
  factory :order_detail do
    quantity{Faker::Number.number(4)}
    price{Faker::Number.decimal(2)}
    order
    product
  end
end
