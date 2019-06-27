class AdminSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name, :email, :role
  attribute :token do |_admin, params|
    params[:token].to_s
  end
end
