class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @buy_info = BuyInfo.new
    if @item.order.present?
      redirect_to root_path
    end
    if current_user.id == @item.user_id 
      redirect_to root_path
    end
  end

  def create
    @buy_info = BuyInfo.new(buy_params)
    if @buy_info.valid?
      pay_item
      @buy_info.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

    def buy_params
      params.require(:buy_info).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :item_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def set_item
      @item = Item.find(params[:item_id])
    end

    def pay_item
      #決済処理の記述
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
      Payjp::Charge.create(
        amount: @item.price,
        card: buy_params[:token],
        currency: 'jpy'
      )
    end
end
