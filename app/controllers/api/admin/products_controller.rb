class Api::Admin::ProductsController < ApplicationController
  before_action :authorize_request, only: %i(create edit update)
  before_action :load_product, only: %i(edit update)

  def create
    ActiveRecord::Base.transaction do
      @product = Product.create! product_params
    end
    render json: {message: I18n.t(".products.product_created")}
  end

  def edit
    data = ProductSerializer.new(@product).serializable_hash
    render json: data
  end

  def update
    ActiveRecord::Base.transaction do
      params[:images_deleted].present? && params[:images_deleted].each do |index|
        @product.images[index]&.purge
      end
      @product.update! product_params
    end
    render json: {message: I18n.t(".products.product_updated")}, status: :ok
  end

  private
  def load_product
    @product = Product.find_by! id: params[:id]
  end

  def product_params
    params.permit :name, :price, :information, :quantity, category_ids: [], images: []
  end
end
