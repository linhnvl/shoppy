module Modules
  class AuthenticationError < CustomError
    def initialize
      super 401, "Unauthenticated"
    end
  end
end
