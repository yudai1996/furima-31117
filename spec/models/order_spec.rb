require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  it "tokenがあれば保存ができる" do
    expect(@order).to be_valid
  end


  it "tokenが空では登録できないこと" do
    @order.token = nil
    @order.valid?
    expect(@order.errors.full_messages).to include()
  end
end