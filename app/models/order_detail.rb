# == Schema Information
#
# Table name: order_details
#
#  id         :bigint           not null, primary key
#  quantity   :integer
#  price      :decimal(10, )
#  order_id   :bigint
#  product_id :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :quantity, presence: true, numericality: {greater_than_or_equal_to: 0}
end
