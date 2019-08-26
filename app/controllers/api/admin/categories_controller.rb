class Api::Admin::CategoriesController < ApplicationController
  def index
    render json: Category.tree
  end
end
