class Order < ApplicationRecord
  #アソシエーション
  belongs_to :user
  belongs_to :item
  has_one    :residence

  #ordersコントローラーがtokenを扱える様設定
  attr_accessor :token
end
