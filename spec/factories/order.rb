FactoryBot.define do
  factory :order do
    status{%i(pending approved cancelled).sample}
    payment_method{%i(cash credit_card).sample}
    user
  end
end
