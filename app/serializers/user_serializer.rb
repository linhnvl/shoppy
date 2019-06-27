class UserSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name, :email
  attribute :role, if: proc{ |params|
    params[:role].present?
  }
  attribute :token do |_user, params|
    params[:token].to_s
  end
end
