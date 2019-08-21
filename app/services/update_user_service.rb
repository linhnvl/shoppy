class UpdateUserService < ApplicationService
  def initialize user, user_params, image
    @user = user
    @user_params = user_params
    @image = image
  end

  def call!
    @user.tap do |u|
      u.skip_password_validation = true
      u.update! @user_params
      u.image.attach @image
    end
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    raise Modules::AttachImageError
  end
end
