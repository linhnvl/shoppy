# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  parent_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  has_many :category_products, dependent: :destroy
  has_many :products, through: :category_products, dependent: :destroy
  has_many :children, class_name: "Category", foreign_key: :parent_id, dependent: :destroy

  validates :name, presence: true
  validates :parent_id, presence: true
end
