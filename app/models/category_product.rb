# == Schema Information
#
# Table name: category_products
#
#  id          :bigint           not null, primary key
#  category_id :bigint
#  product_id  :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CategoryProduct < ApplicationRecord
  belongs_to :category
  belongs_to :product
end
