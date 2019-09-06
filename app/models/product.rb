# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  name        :string(255)
#  price       :decimal(10, )
#  information :text(65535)
#  quantity    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ApplicationRecord
  has_many :category_products, dependent: :destroy
  has_many :order_details, dependent: :destroy
  has_many :categories, through: :category_products, dependent: :destroy
  has_many :orders, through: :order_details, dependent: :destroy
  has_many_attached :images

  validates :name, presence: true
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :information, presence: true
  validates :quantity, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :images, size: {less_than: 5.megabytes, message: I18n.t(".validate_image.size")},
    content_type: {in: Settings.validate_image.content_type, message: I18n.t(".validate_image.content_type")}

  scope :search_by_name, ->(keyword){where "lower(name) LIKE ?", "%#{keyword.downcase}%"}
end
