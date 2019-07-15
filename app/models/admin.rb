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
#

class Admin < ApplicationRecord
  has_secure_password
  enum role: {system_admin: 0, shop_admin: 1}

  validates :name, presence: true
  validates :email, presence: true, format: {with: Settings.VALID_EMAIL_REGEX}, uniqueness: true
  validates :password_digest, presence: true
  validates :password, format: {with: Settings.VALID_PASSWORD_REGEX}
  validates :role, presence: true
end
