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
end
