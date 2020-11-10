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
  
end
