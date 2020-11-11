require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品の登録' do

    context '出品登録が成功するとき' do
      it "各項目が存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '出品登録が失敗する時' do

      it "nameが空の時登録失敗" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "infoが空の時失敗" do
        @item.info = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end

      it "カテゴリーが未選択の時（idが１の時失敗）" do 
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "カテゴリーが未選択の時（idがnillの時失敗）" do 
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "商品の状態が未選択の時（idが１の時失敗）" do 
        @item.status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end

      it "商品の状態が未選択の時（idがnilの時失敗）" do 
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", )
      end

      it "配送料の負担が未選択の時（idが１の時失敗）" do 
        @item.shipping_fee_status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status must be other than 1")
      end

      it "配送料の負担が未選択の時（idがnilの時失敗）" do 
        @item.shipping_fee_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
      end


      it "配送元の地域が未選択の時（idが１の時失敗）" do 
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "配送元の地域が未選択の時（idがnilの時失敗）" do 
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "配送までの日数が未選択の時（idが１の時失敗）" do 
        @item.delivery_scheduled_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery scheduled must be other than 1")
      end

      it "配送までの日数が未選択の時（idがnilの時失敗）" do 
        @item.delivery_scheduled_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery scheduled can't be blank")
      end

      it "priceが空の時登録失敗" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceが299円以下の時登録失敗" do 
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it "priceが10,000,000以上円以下の時登録失敗" do 
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it "priceに文字列記入時登録失敗" do 
        @item.price = "price"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it "imageが空の時登録失敗" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end






  end
end
