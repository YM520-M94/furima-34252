class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
  end

  private
  def product_params
    params.require(:product).permit(:product, :listing_person, :price, :category_id, :product_state_id, :delivery_charge_id, :prefecture_id, :delivery_date_id)
  end

end
