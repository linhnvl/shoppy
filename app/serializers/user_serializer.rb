class UserSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name, :email
  attribute :token do |_, params|
    params[:token].to_s
  end
end
