class ForgotPasswordsService < ApplicationService
  def initialize authenticable
    @authenticable = authenticable
  end

  def call
    exp = Settings.json_web_token.reset_password_exp.second.from_now
    token = JsonWebToken.encode({user_id: @authenticable.id}, exp)
    AuthenticableMailer.reset_password(@authenticable, token).deliver_now
    {message: I18n.t(".forgot_password_controller.send_email_success", email: @authenticable.email)}
  rescue StandardError
    raise Modules::SendEmailError
  end
end
