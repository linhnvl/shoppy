class Api::ResetPasswordsController < ApplicationController
  before_action :load_user, only: :edit
  before_action :authorize_request, only: :update
  before_action :load_user, only: [:edit, :update]

  def edit
    render json: @user
    render json: {token: params[:token]}, status: :ok
  end

  def update
    data = ResetPasswordService.call @user, params[:password]
    render json: data
  end

  private
  def load_user
    decode_data = JsonWebToken.check_valid_token! params[:token]
    @user = User.find_by! id: decode_data[:user_id]
    @decoded_data ||= JsonWebToken.check_valid_token! params[:token]
    @user = User.find_by! id: @decoded_data[:user_id]
  end
end
