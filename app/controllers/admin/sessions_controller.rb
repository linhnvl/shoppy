class Admin::SessionsController < ApplicationController
  include SessionsHelper
  before_action :load_admin, only: :create

  def create
    if @admin&.authenticate params[:password]
      render_authenticated @admin, @admin.role
    else
      render_unauthenticated_error
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
