module Error
  class AuthenticationError < CustomError
    def initialize
      super 401, "unauthentication"
    end
  end
end
