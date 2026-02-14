class OrderHistoriesController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @item = Item.find(params[:item_id])
  end

  #  def create
  #    @order_history = OrderHistory.create(order_history_params)
  #    if @order_history.save
  #      @shipping = Shipping.create(shipping_params.merge(order_history_id: @order_history.id))
  #      redirect_to root_path
  #    else
  #      render :new, status: :unprocessable_content
  #    end
  #  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :item_status_id, :shipping_fee_id, :prefecture_id,
                                 :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def order_history_params
    params.permit(:item_id, :user_id)
  end

  def shipping_params
    params.permit(:postscript, :prefecture_id, :city, :house_number, :building, :phone_number)
  end
end
