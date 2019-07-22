class AuthenticationService < ApplicationService
  def initialize authenticable, password, remember_me = false
    @authenticable = authenticable
    @password = password
    @remember_me = remember_me
  end

  def call
    raise Modules::AuthenticationError unless @authenticable&.authenticate @password

    exp = Settings.json_web_token.short_expires_in.second.from_now
    exp = Settings.json_web_token.expires_in.second.from_now if @remember_me
    token = JsonWebToken.encode({user_id: @authenticable.id}, exp)
    if @authenticable.is_a? User
      UserSerializer.new(@authenticable, params: {token: token}).serializable_hash
    else
      AdminSerializer.new(@authenticable, params: {token: token}).serializable_hash
    end
  end
end
