class SessionsController < ApplicationController
  include SessionsHelper
  before_action :load_user, only: :create

  def create
    if @user&.authenticate params[:password]
      render_authenticated @user
    else
      render_unauthenticated_error
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
