class BuyInfo
  include ActiveModel::Model
  #ordersテーブルとresidencesテーブルのカラム名記述
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :order_id, :number, :exp_month, :exp_year, :cvc

  #バリデーションの設定(配送先住所)
  with_options presence: true do
    validates :postal_code,    format: {with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :house_number
    #任意入力 validates :building
    validates :phone_number,   format: { with: /\A\d{10,11}\z/ }
  end
  #バリデーション(token)
  #validates :token, presence: true

  #バリエーション(カード情報)
  with_options presence: true do
    validates :number
    validates :exp_month
    validates :exp_year
    validates :cvc
  end

  def save
    Order.create(item_id: item_id, user_id: user_id)
    Residence.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, phone_number: phone_number, order_id: order_id )
  end
  
end