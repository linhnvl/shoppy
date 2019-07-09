module Modules
  class AuthenticationError < CustomError
    def initialize
      super 401, I18n.t(".error_message.authentication_error")
    end
  end
end
