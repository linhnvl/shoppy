# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  phone_number    :string(255)
#  address         :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_many :orders, dependent: :destroy

  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, format: {with: Settings.VALID_EMAIL_REGEX}, uniqueness: true
  validates :password_digest, presence: true
  validates :password, format: {with: Settings.VALID_PASSWORD_REGEX}
end
