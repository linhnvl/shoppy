module Modules
  class AttachImageError < CustomError
    def initialize
      super 401, I18n.t(".validate_image.invalid")
    end
  end
end
