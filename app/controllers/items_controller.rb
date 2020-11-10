class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end
  
end
