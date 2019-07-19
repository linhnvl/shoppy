class JsonWebToken
  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

  class << self
    def encode payload, exp = 24.hours.from_now
      payload[:exp] = exp.to_i
      JWT.encode payload, SECRET_KEY
    end

    def decode token
      data = JWT.decode(token, SECRET_KEY)[0]
      HashWithIndifferentAccess.new data
    end

    def check_valid_token! token
      @decode = decode token
    rescue JWT::DecodeError
      raise Modules::InvalidTokenError
    end
  end
end
