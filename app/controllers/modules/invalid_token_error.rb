module Modules
  class InvalidTokenError < CustomError
    def initialize
      super 401, I18n.t(".error_message.invalid_token")
    end
  end
end
