class Api::ProductsController < ApplicationController
  before_action :authorize_request, only: :create

  def create
    ActiveRecord::Base.transaction do
      @product = Product.create! product_params
    end
    render json: {message: I18n.t(".products.product_created")}
  end

  private
  def product_params
    params.permit :name, :price, :information, :quantity, images: []
  end
end
