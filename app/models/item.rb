class Item < ApplicationRecord
  #アソシエーション
  belongs_to :user

  #アソシエーション(ActivHash)
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery
  belongs_to :prefecture
  belongs_to :shipping_fee
  belongs_to :status

  #バリデーションの設定
  validates :name,                   presence: true
  validates :info,                   presence: true
  validates :category_id,            presence: true, numericality: { other_than: 1 }
  validates :status_id,              presence: true, numericality: { other_than: 1 }
  validates :shipping_fee_status_id, presence: true, numericality: { other_than: 1 }
  validates :prefecture_id,          presence: true, numericality: { other_than: 1 }
  validates :delivery_scheduled_id,  presence: true, numericality: { other_than: 1 }
  validates :price,                  presence: true
  validates :image,                  presence: true
end
