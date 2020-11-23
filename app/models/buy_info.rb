class BuyInfo  
  include ActiveModel::Model
  #1:ファイル・クラス作成及び「include ActiveModel::Model」でバリエーションとform_withに関する機能を使用可能に←問題なし
  #ordersコントローラーがtokenを扱える様設定
  attr_accessor :token



  #2:ordersテーブルとresidencesテーブルのカラム名全て記述(exp_month,exp_year,cvcは未記述だとエラー発生の為記述、テーブルは無し)
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :number, :exp_month, :exp_year, :cvc, :id, :created_at, :updated_at




  #3:各バリデーションの記述（valid?=>true,invalid?=>falseの為、バリデーションによるエラーの可能性：低）
  #バリデーションの設定(配送先住所)
  with_options presence: true do
    validates :postal_code,    format: {with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id,  numericality: { other_than: 1 }
    validates :city
    validates :house_number
    #任意入力 validates :building
    validates :phone_number,   format: {with: /\A\d{11}\z/ }
  end

  #バリデーション(token)
  validates :token, presence: true
  


 #4:保存処理の記述 1,2,3からこの記述でのエラーの可能性：大 Order.create(user_id: user_id, item_id: item_id)を削除したところrollbackは発生しなくなった
  def save
    Residence.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, phone_number: phone_number, id: id, created_at: created_at, updated_at: updated_at)
    Order.create(item_id: item_id, user_id: user_id)
  end
end