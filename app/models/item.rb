class Item < ApplicationRecord
  #アソシエーション
  belongs_to :user
  has_one_attached :image
  has_one :order


  #アソシエーション(ActivHash)
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_scheduled
  belongs_to :prefecture
  belongs_to :shipping_fee_status
  belongs_to :status

  #バリデーションの設定
  with_options presence: true do
    validates :name
    validates :info
    validates :category_id,            numericality: { other_than: 1 }
    validates :status_id,              numericality: { other_than: 1 }
    validates :shipping_fee_status_id, numericality: { other_than: 1 }
    validates :prefecture_id,          numericality: { other_than: 1 }
    validates :delivery_scheduled_id,  numericality: { other_than: 1 }
    validates :price,                  format: { with: /\A[0-9]+\z/ }, inclusion: {in: 300..9999999 }
    validates :image
  end
end
