namespace :user do
  desc "Seed User"
  task create: :environment do
    Admin.create(
      name: "Admin",
      email: "admin@gmail.com",
      password: "Abcd1234",
      role: 0
    )

    User.create(
      name: "Luat Hoang",
      email: "luat@gmail.com",
      password: "Abcd1234",
      phoneNumber: Faker::PhoneNumber.phone_number,
      address: Faker::Address.street_address,
      city: Faker::Address.city,
      country: Faker::Address.country,
      postalCode: Faker::Address.postcode
    )

    10.times do |n|
      Admin.create!(
        name: "Admin #{n+1}",
        email: "admin#{n+1}@gmail.com",
        password: "Abcd1234",
        role: rand(0..1)
      )
    end
  end
end
