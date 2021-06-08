class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @products = Product.includes(:user).order(created_at:"desc")
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
    params.require(:product).permit(:product, :listing_person, :price, :category_id, 
      :product_state_id, :delivery_charge_id, :prefecture_id, :delivery_date_id, :image)
      .merge(user_id: current_user.id)
  end

end
