class PurchasersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @purchaser_address = PurchaserAddress.new
  end

  def create
    @purchaser_address = PurchaserAddress.new(purchaser_params)
    if @purchaser_address.valid?
      @purchaser_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchaser_params
    params.require(:purchaser_address).permit(:postal_code, :prefecture_id, :city, :block, :building_name, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id])
  end

end
