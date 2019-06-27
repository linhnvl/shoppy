class UserSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name, :email
  attribute :token do |_user, params|
    params[:token].to_s
  end
end
