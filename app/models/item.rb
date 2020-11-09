class Item < ApplicationRecord
  #アソシエーション
  belongs_to :user

  #バリデーションの設定
  validates :name,                   presence: true
  validates :info,                   presence: true
  validates :category_id,            presence: true
  validates :status_id,              presence: true
  validates :shipping_fee_status_id, presence: true
  validates :prefecture_id,          presence: true
  validates :delivery_scheduled_id,  presence: true
  validates :price,                  presence: true
  validates :image,                  presence: true
end
