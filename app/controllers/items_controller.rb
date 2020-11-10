class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def created
    @item = Item.new(item_params)
    if @item.save
      render:index
    else
      redorect_to 
    end
  end

  private

  def
    params.require(item).permit(:name, :info, :category_id, :status_id, :shipping_fee_status_id, :prefecture_id, :delivery_scheduled_id, :price, :image).merge(user_id: current_user.id)
  end
  
end
