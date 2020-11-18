class BuyInfo
  include ActiveModel::Model
  #ordersテーブルとresidencesテーブルのカラム名記述
  attr_accessor :item_id, :user_id, :postal_code, :prefectures_id, :city, :house_number, :building, :phone_number, :order_id
end