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
    # redirect_to product_show_path
  end

  def favorites
    @favorites = Search.where(favorite: true)
  end

  def edit
    @search = Search.find(params[:id])
    @user = current_user
    @product = Product.find(params[:product_id])
    # authorize @lama
  end

  def update
    @search = Search.find(params[:id])
    @favorite = @search.favorite ? false : true
    if @search.update(favorite: @favorite)
      respond_to do |format|
        format.html { redirect_to product_path(@search.product_id) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'products/show' }
        format.js  # <-- idem
      end
    end
  end

  private

  def search_params
    params.require(:search).permit(:favorite)
  end
end
