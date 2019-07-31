class Api::Admin::ResetPasswordsController < ApplicationController
  before_action :authorize_request, only: :update
  before_action :load_admin, only: [:edit, :update]

  def edit
    render json: {token: params[:token]}, status: :ok
  end

  def update
    data = ResetPasswordService.call! @admin, params[:password]
    render json: data
  end

  private
  def load_admin
    @decoded_data ||= JsonWebToken.check_valid_token! params[:token]
    @admin = ::Admin.find_by! id: @decoded_data[:user_id]
  end
end
