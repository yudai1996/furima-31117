class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @buy_info = BuyInfo.new
    if current_user.id == @item.user_id 
      redirect_to root_path
    end
  end

  def create
    @buy_info = BuyInfo.new(buy_params)
    if @buy_info.valid?
      @buy_info.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render action: :index
    end
  end

  private

    def buy_params
      params.require(:buy_info).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :item_id).merge(user_id: current_user.id)
    end
end
