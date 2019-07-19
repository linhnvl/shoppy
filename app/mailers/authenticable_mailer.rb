class AuthenticableMailer < ApplicationMailer
  def reset_password authenticable, token
    @authenticable = authenticable
    @token = token
    mail to: authenticable.email, subject: "Password reset"
  end
end
