class Api::ResetPasswordsController < ApplicationController
  before_action :load_user, only: :edit

  def edit
    render json: @user
  end

  private
  def load_user
    decode_data = JsonWebToken.check_valid_token! params[:token]
    @user = User.find_by! id: decode_data[:user_id]
  end
end
