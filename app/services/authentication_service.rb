class AuthenticationService < ApplicationService
  def initialize authenticable, password, remember_me
    @authenticable = authenticable
    @password = password
    @remember_me = remember_me
  end

  def call
    raise Modules::AuthenticationError unless @authenticable&.authenticate @password

    exp = @remember_me ? 14.days.from_now : 24.hours.from_now
    token = JsonWebToken.encode({user_id: @authenticable.id}, exp)
    if @authenticable.is_a? User
      UserSerializer.new(@authenticable, params: {token: token}).serializable_hash
    else
      AdminSerializer.new(@authenticable, params: {token: token}).serializable_hash
    end
  end
end
