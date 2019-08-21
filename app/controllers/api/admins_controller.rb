class Api::AdminsController < ApplicationController
  before_action :load_admin, only: :destroy
  before_action :authorize_request, :load_user, only: :create

  def create
    admin = ::Admin.new admin_params
    if create_admin_trans admin, @user
      message = ForgotPasswordsService.call! admin, params[:domain]
      render json: message
    else
      render json: {message: I18n.t(".error_message.send_email_error")}
    end
  end

  def index
    @admin = ::Admin.order_desc
    render json: @admin
  end

  def destroy
    @admin.destroy!
    render json: {message: I18n.t(".admins.destroy_success", adminName: @admin.name)}
  end

  private
  def admin_params
    params.permit(:email, :role).merge name: @user.name, password_digest: @user.password_digest,
      skip_password_validation: true
  end

  def load_user
    @user = ::User.find_by! email: params[:email]
  end

  def load_admin
    @admin = ::Admin.find_by! id: params[:id]
  end

  def create_admin_trans admin, user
    ActiveRecord::Base.transaction do
      admin.save!
      user.destroy!
    end
  end
end
