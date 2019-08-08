# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  phoneNumber     :string(255)
#  address         :string(255)
#  city            :string(255)
#  country         :string(255)
#  postalCode      :string(255)
#  userName        :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  attr_accessor :skip_password_validation

  has_many :orders, dependent: :destroy

  has_secure_password
  has_one_attached :image

  validates :name, presence: true
  validates :email, presence: true, format: {with: Settings.VALID_EMAIL_REGEX}, uniqueness: true
  validates :password, presence: true, format: {with: Settings.VALID_PASSWORD_REGEX}, unless: :skip_password_validation
  validates :image, size: {less_than: 5.megabytes, message: I18n.t(".validate_image.size")},
    content_type: {in: Settings.validate_image.content_type, message: I18n.t(".validate_image.content_type")}
end
