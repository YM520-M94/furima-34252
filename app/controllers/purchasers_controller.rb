class PurchasersController < ApplicationController
  before_action :authenticate_user!,      only: [:index, :create]
  before_action :set_params,              only: [:index, :create]
  before_action :move_to_index,           only: [:index, :create]
  before_action :move_to_index_purchaser, only: [:index, :create]

  def index
    @purchaser_address = PurchaserAddress.new
  end

  def create
    @purchaser_address = PurchaserAddress.new(purchaser_params)
    if @purchaser_address.valid?
      pay_product
      @purchaser_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchaser_params
    params.require(:purchaser_address).permit(:postal_code, :prefecture_id, :city, :block, :building_name, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: purchaser_params[:token],
      currency: 'jpy'
    )
  end

  def set_params
    @product = Product.find(params[:product_id])
  end

  def move_to_index
    if current_user.id == @product.user_id
    redirect_to root_path 
    end
  end

  def move_to_index_purchaser
    if @product.purchaser.present?
      redirect_to root_path 
    end
  end

end
