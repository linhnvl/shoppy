class Api::UsersController < ApplicationController
  before_action :load_user, only: %i(edit update)
  before_action :authorize_request, only: %i(edit update)

  def edit
    data = UserSerializer.new(@user).serializable_hash
    render json: data
  end

  def update
    @user.skip_password_validation = true
    ActiveRecord::Base.transaction do
      @user.update! user_params
    end
    render json: {user: @user}
  end

  private
  def load_user
    @user = User.find_by! id: params[:id]
  end

  def user_params
    params.permit :name, :address, :city, :country, :postalCode, :phoneNumber, :image, :userName
  end
end
