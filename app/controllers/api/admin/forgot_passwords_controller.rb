class Api::Admin::ForgotPasswordsController < ApplicationController
  before_action :load_admin, only: :create

  def create
    message = ForgotPasswordsService.call @admin
    render json: message
  end

  private
  def load_admin
    @admin = ::Admin.find_by! email: params[:email]
  end
end
