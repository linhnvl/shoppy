# == Schema Information
#
# Table name: admins
#
#  id              :bigint           not null, primary key
#  name            :string(255)
#  email           :string(255)
#  role            :integer
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  deleted_at      :datetime

class Admin < ApplicationRecord
  attr_accessor :skip_password_validation

  enum role: {system_admin: 0, shop_admin: 1}

  acts_as_paranoid
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, format: {with: Settings.VALID_EMAIL_REGEX}, uniqueness: true
  validates :password, presence: true, format: {with: Settings.VALID_PASSWORD_REGEX},
    unless: ->{skip_password_validation}
  validates :role, presence: true
end
