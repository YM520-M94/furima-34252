class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product,          only: [:show, :edit, :update]

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

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  private
  
  def product_params
    params.require(:product).permit(:product, :listing_person, :price, :category_id, 
      :product_state_id, :delivery_charge_id, :prefecture_id, :delivery_date_id, :image)
      .merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
