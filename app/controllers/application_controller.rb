class ApplicationController < ActionController::API
  include Modules::ErrorHandler
  include HandleRequestHelper

  before_action :set_locale

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: {message: I18n.t(".error_message.record_not_found", record: exception.model)}, status: :not_found
  end

  rescue_from ActiveRecord::RecordInvalid do |exception|
    render json: {message: exception.message}, status: :unprocessable_entity
  end

  rescue_from ActiveRecord::RecordNotDestroyed do |exception|
    render json: {message: exception.message}, status: :internal_server_error
  end

  rescue_from ActiveSupport::MessageVerifier::InvalidSignature do |exception|
    render json: {message: exception.message}, status: :unauthorized
  end

  def set_locale
    locale = extract_locale_from_header

    I18n.locale =
      if locale_valid? locale
        locale
      else
        :en
      end
  end

  private

  def locale_valid? locale
    I18n.available_locales.map(&:to_s).include?(locale)
  end

  def extract_locale_from_header
    accept_language = request.env["HTTP_ACCEPT_LANGUAGE"]
    return unless accept_language

    accept_language.scan(/^[a-z]{2}/).first
  end
end
