module Modules
  class SendEmailError < CustomError
    def initialize
      super 600, I18n.t(".error_message.send_email_error")
    end
  end
end
