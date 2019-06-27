class SessionsController < ApplicationController
  include SessionsHelper
  before_action :load_user, only: :create

  def create
    exp = params[:remember_me] == "true" ? Settings.exp.remember : Settings.exp.no_remember
    if @user&.authenticate params[:password]
      token = JsonWebToken.encode({user_id: @user.id}, exp)
      data = UserSerializer.new(@user, params: {token: token}).serializable_hash
      render json: data
    else
      render_unauthorize_error
    end
  end

  private
  def load_user
    @user = User.find_by(email: params[:email])
  end

  def login_params
    params.permit(:email, :password, :remember_me)
  end
end
