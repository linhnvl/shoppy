class ApplicationController < ActionController::API
  include Modules::ErrorHandler

  before_action :set_locale

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: {message: I18n.t(".error_message.record_not_found", record: exception.model)}, status: :not_found
  end

  def set_locale
    I18n.locale = extract_locale_from_header
  end

  private
  def extract_locale_from_header
    (request.env["HTTP_ACCEPT_LANGUAGE"] || "en").scan(/^[a-z]{2}/).first
  end
end
