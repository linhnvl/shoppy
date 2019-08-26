namespace :category_product do
  desc "Seed CategoryProduct"
  task create: :environment do
    21.times do |n|
      CategoryProduct.create(
        product_id: n+1,
        category_id: rand(1..5)
      )
      
      CategoryProduct.create(
        product_id: n+5,
        category_id: rand(6..10)
      )
    end
  end
end
