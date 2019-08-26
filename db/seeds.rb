Rake::Task["db:migrate:reset"].invoke
Rake::Task["user:create"].invoke
Rake::Task["product:create"].invoke
Rake::Task["category:create"].invoke
Rake::Task["category_product:create"].invoke
