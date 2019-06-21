# == Schema Information
#
# Table name: users
#
#  id                   :bigint           not null, primary key
#  name                 :string(255)
#  email                :string(255)
#  password_digest      :string(255)
#  remember_digest      :string(255)
#  phone_number         :string(255)
#  address              :string(255)
#  reset_password_token :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class User < ApplicationRecord
  has_many :orders, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, format: {with: Settings.VALID_EMAIL_REGEX}, uniqueness: true
  validates :password_digest, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
end
