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
  belongs_to :parent, class_name: "Category", optional: true

  validates :name, presence: true
  validates :parent_id, numericality: true, allow_nil: true

  scope :roots, ->{ where(parent_id: nil) }

  class << self
    def tree
      Category.roots.includes(:children).reduce([]) do |output, child|
        output << node(child)
      end
    end
  end

  private
  class << self
    def node category
      children = category.children.includes(:children).reduce([]) do |categories, child|
        categories << node(child)
      end
      {value: category.id, title: category.name, children: children}
    end
  end
end
