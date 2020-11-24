class BuyInfo  
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :token

  #バリデーションの設定(配送先住所)
  with_options presence: true do
    validates :postal_code,    format: {with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id,  numericality: { other_than: 1 }
    validates :city
    validates :house_number
    #任意入力 validates :building
    validates :phone_number,   format: {with: /\A\d{11}\z/ }
    validates :token
    validates :item_id
    validates :user_id
  end

  def save
    Residence.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, phone_number: phone_number)
    Order.create(item_id: item_id, user_id: user_id)
  end
end