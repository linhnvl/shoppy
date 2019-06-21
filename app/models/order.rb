# == Schema Information
#
# Table name: orders
#
#  id             :bigint           not null, primary key
#  status         :integer
#  payment_method :integer
#  user_id        :bigint
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :products, through: :order_details, dependent: :destroy

  belongs_to :user

  enum status: {pending: 0, approved: 1, cancelled: 2}
  enum payment_method: {cash: 0, credit_card: 1}

  validates :status, presence: true
  validates :payment_method, presence: true
end
