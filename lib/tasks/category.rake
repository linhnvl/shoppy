namespace :category do
  desc "Seed Category"
  task create: :environment do
    Category.create(
      name: "Category 1",
    )
    
    5.times do |n|
      Category.create(
        name: "Category #{n+2}",
        parent_id: 1
      )
    end
    
    4.times do |n|
      Category.create(
        name: "Category #{n+7}",
        parent_id: 3
      )
    end

    2.times do |n|
      Category.create(
        name: "Category #{n+11}",
      )
    end
  end
end
