FactoryBot.define do
  factory :category do
    name{Faker::Name.name}
    parent_id{Faker::Number.number(2)}
  end
end
