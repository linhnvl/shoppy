class AuthenticationService < ApplicationService
  def initialize authenticable, password, remember_me
    @authenticable = authenticable
    @password = password
    @remember_me = remember_me
  end

  def call
    raise Error::AuthenticationError unless @authenticable&.authenticate @password

    exp = @remember_me ? Settings.exp.remember : Settings.exp.no_remember
    token = JsonWebToken.encode({user_id: @authenticable.id}, exp)
    if @authenticable.is_a? User
      UserSerializer.new(@authenticable, params: {token: token}).serializable_hash
    else
      AdminSerializer.new(@authenticable, params: {token: token}).serializable_hash
    end
  end
end
