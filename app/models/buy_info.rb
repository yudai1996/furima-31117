class BuyInfo
  include ActiveModel::Model
  #ordersテーブルとresidencesテーブルのカラム名記述
  attr_accessor :item_id, :user_id, :postal_code, :prefectures_id, :city, :house_number, :building, :phone_number, :order_id

  #バリデーションの設定(配送先住所)
   with_options presence: true do
    validates :postal_code,    format: {with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefectures_id, numericality: { other_than: 1 }
    validates :city
    validates :house_number
    #任意入力 validates :building
    validates :phone_number,   format: { with: \A0[5789]0[-]?\d{4}[-]?\d{4}\z }
  end
  #バリデーション(token)
  validates :token, presence: true
  #バリエーション(カード情報)
  with_options presence: true do
    validates :number
    validates :exp_month
    validates :exp_year
    validates :cvc
  end
  
end