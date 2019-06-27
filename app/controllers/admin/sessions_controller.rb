class Admin::SessionsController < ApplicationController
  include SessionsHelper
  before_action :load_admin, only: :create

  def create
    exp = params[:remember_me] == "true" ? Settings.exp.remember : Settings.exp.no_remember
    if @admin&.authenticate params[:password]
      token = JsonWebToken.encode({user_id: @admin.id}, exp)
      data = AdminSerializer.new(@admin, params: {token: token}).serializable_hash
      render json: data
    else
      render_unauthorize_error
    end
  end

  private
  def load_admin
    @admin = Admin.find_by(email: params[:email])
  end

  def login_params
    params.permit(:email, :password, :remember_me)
  end
end
