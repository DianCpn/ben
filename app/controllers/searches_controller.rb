class SearchesController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @search = Search.new
  end

  def create
    @search = Search.new(search_params)
    @user = current_user
    @product = Product.find(params[:product_id])
    @search.user = @user
    @search.product = @product
    @search.save
  end

  def favorites
    @favorite = Product.where(favorite: true)
  end

  private

  def search_params
    params.require(:search).permit(:favorite)
  end
end
