namespace :product do
  desc "Seed Product"
  task create: :environment do
    10.times do |n|
      product = Product.create(
        name: Faker::Commerce.product_name,
        price: Faker::Commerce.price,
        information: Faker::Lorem.paragraph,
        quantity: rand(0..1000),
        images: [],
      )
      product.images.attach(io: File.open("app/assets/seed/tee.jpg"), filename: "tee #{n}")
      product.images.attach(io: File.open("app/assets/seed/jean.jpeg"), filename: "jean #{n}")
    end
  end
end
