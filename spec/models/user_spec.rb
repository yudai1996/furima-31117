require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録が成功するとき' do
        it "各項目が存在すれば登録できる" do
          expect(@user).to be_valid
        end
      end

      context '新規登録が失敗するとき' do
        
        it "nameが空では登録できない" do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it "emailが空では登録できない" do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it "メールアドレスが重複していると登録できない" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end

        it "メールアドレスに@が存在しないと登録できない" do
          @user.email = "yyydagmail"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end

        it "passwordが空では登録できない" do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it "password (確認用)が空では登録できない" do
          @user.password_confirmation = nil
          @user.valid?
          expect(@user.errors.full_messages).to include()
        end


        it "苗字（平仮名）が空では登録できない" do
          @user.last_name_hira = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name hira can't be blank")
        end

        it  "名前（平仮名）が空では登録できない" do
          @user.first_name_hira = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name hira can't be blank")
        end

        it "苗字（カタカナ）が空では登録できない" do
          @user.last_name_kata = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kata can't be blank")
        end

        it "名前（カタカナ）が空では登録できない" do
          @user.first_name_kata = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kata can't be blank")
        end

        it "名前全角（漢字・ひらがな・カタカナ）以外では登録できない" do
          @user.save
          @user.last_name_hira = "testman"
          @user.first_name_hira = "testwomen"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name hira is invalid", "First name hira is invalid")
        end

        it "フリガナ全角（カタカナ）以外では登録できない" do
          @user.save
          @user.last_name_kata = "testman"
          @user.first_name_kata = "testwomen"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kata is invalid", "First name kata is invalid")
        end

        it "生年月日が空では登録できない" do
          @user.day_of_birthday = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Day of birthday can't be blank")
        end

      end
    end
  end
end