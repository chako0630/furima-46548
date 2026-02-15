class OrderHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: :create

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_history_shipping = OrderHistoryShipping.new
  end

  def create
    @order_history_shipping = OrderHistoryShipping.new(order_history_shipping_params)

    if @order_history_shipping.valid?
      pay_item
      @order_history_shipping.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_content
    end
  end

  private

  def order_history_shipping_params
    params.require(:order_history_shipping).permit(:postscript, :prefecture_id, :city, :house_number, :building, :phone_number)
          .merge(
            item_id: params[:item_id], user_id: current_user.id, token: params[:token]
          )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_history_shipping_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user_id || @item.order_history.present?
  end
end
