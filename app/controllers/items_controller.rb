class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order("created_at DESC") #一覧表示用の一時収納箱用意、並び順を降順へ
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @user = User.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :status_id, :shipping_fee_status_id, :prefecture_id, :delivery_scheduled_id, :price).merge(user_id: current_user.id)
  end

  
end
