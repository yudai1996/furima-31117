require 'rails_helper'

RSpec.describe Residence, type: :model do
  describe '#create' do
    before do
      @order = FactoryBot.create(:residence)
    end

    describe '商品購入登録' do
      context '商品購入が成功' do
        it "各項目が存在すれば登録できる" do
          expect(@order).to be_valid
        end
      end

      context '商品購入が失敗するとき' do
        
        it "postal_codeが空では登録できない" do
          @order.postal_code = nil
          @order.valid?
          #expect(@order.errors.full_messages).to include()
        end

        it "postal_codeにハイフンがないと登録できない" do
          @order.postal_code = 1234567
          @order.valid?
          #expect(@order.errors.full_messages).to include()
        end

        it "prefecture_idが未選択(1)では登録できない" do
          @order.prefecture_id = "1"
          @order.valid?
          #expect(@order.errors.full_messages).to include()
        end

        it "cityが空だと登録できない" do
          @order.city = nil
          @order.valid?
          #expect(@order.errors.full_messages).to include()
        end

        it "house_numberが空では登録できない" do
          @order.house_number = nil
          @order.valid?
          #expect(@order.errors.full_messages).to include()
        end

        it "phone_number が空では登録できない" do
          @order.phone_number  = nil
          @order.valid?
          #expect(@order.errors.full_messages).to include()
        end


        it "phone_numberにハイフンがあると登録できない" do
          @order.phone_number  = 980-1234-5678
          @order.valid?
          #expect(@order.errors.full_messages).to include()
        end

        

      end
    end
  end
end
