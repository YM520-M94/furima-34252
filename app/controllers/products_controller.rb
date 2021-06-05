class ProductsController < ApplicationController

  def index
    @products = Product.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  
  def product_params
    params.require(:product).permit(:product, :listing_person, :price, :category_id, :product_state_id, :delivery_charge_id, :prefecture_id, :delivery_date_id, :image)
  end

end
