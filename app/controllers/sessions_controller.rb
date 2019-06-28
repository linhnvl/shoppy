class SessionsController < ApplicationController
  before_action :load_user, only: :create

  def create
    data = AuthenticationService.call @user, params[:password], params[:remember_me]
    render json: data
  end

  private
  def load_user
    @user = User.find_by email: params[:email]
  end

  def login_params
    params.permit :email, :password, :remember_me
  end
end
