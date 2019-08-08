class UserSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name, :email, :address, :city, :country, :postalCode, :phoneNumber, :userName

  attribute :image do |object|
    nil || Rails.application.routes.url_helpers.url_for(object.image) if object.image&.attached?
  end

  attribute :token do |_, params|
    params[:token].to_s
  end
end
