class OrderHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: :create

  def index
    @order_history_shipping = OrderHistoryShipping.new
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

  def order_history_shipping_params
    params.require(:order_history_shipping).permit(:postscript, :prefecture_id, :city, :house_number, :building, :phone_number).merge(
      item_id: params[:item_id], user_id: current_user.id
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    return if @item.user_id == current_user.id && @item.order_history.present?

    redirect_to root_path
  end
end
