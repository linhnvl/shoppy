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
      name: "Luat",
      email: "luat@gmail.com",
      password: "Abcd1234"
    )
  end
end
