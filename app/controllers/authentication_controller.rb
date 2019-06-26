class AuthenticationController < ApplicationController
  before_action :load_user, only: :login

  # POST /auth/login
  def login
    @exp = params[:remember_me] == "true" ? 14.days.from_now : 24.hours.from_now
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode({user_id: @user.id}, @exp)
      render json: {token: token, exp: @exp.strftime("%m-%d-%y %H:%M%p GMT%:z"),
                    admin: params[:admin]}, status: :ok
    else
      render json: {error: "unauthorized"}, status: :unauthorized
    end
  end

  private

  def load_user
    return @user = Admin.find_by(email: params[:email]) if params[:admin] == "true"

    @user = User.find_by(email: params[:email])
  end

  def login_params
    params.permit(:email, :password, :admin, :remember_me)
  end
end
