class Api::AdminsController < ApplicationController
  before_action :load_admin, only: :destroy

  def index
    @admin = ::Admin.order_desc.paginate page: params[:page], per_page: Settings.admins.per_page
    render json: @admin
  end

  def destroy
    @admin.destroy!
    render json: {message: I18n.t(".admins.destroy_success")}
  end

  private
  def load_admin
    @admin = ::Admin.find_by! id: params[:id]
  end
end
