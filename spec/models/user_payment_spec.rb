require 'rails_helper'

RSpec.describe UserPayment, type: :model do
  describe '購入機能の保存' do
    context 'うまくいく場合' do
      before do
        user1 = FactoryBot.create(:user)
        user2 = FactoryBot.create(:user)
        product = FactoryBot.create(:product, user_id: user2.id)
        @user_payment = FactoryBot.build(:user_payment, user_id: user1.id, product_id: product.id)
      end
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user_payment).to be_valid
      end
    end

    context 'うまくいかない場合' do
      before do
        user1 = FactoryBot.create(:user)
        user2 = FactoryBot.create(:user)
        product = FactoryBot.create(:product, user_id: user2.id)
        @user_payment = FactoryBot.build(:user_payment, user_id: user1.id, product_id: product.id)
      end
      it 'post_codeが空だと購入できないこと' do
        #binding.pry
        @user_payment.post_code = ""
        @user_payment.valid?
        expect(@user_payment.errors.full_messages).to include("Post code can't be blank", "Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeが-を含められてないと購入できない' do
        @user_payment.post_code = '123112'
        @user_payment.valid?
        expect(@user_payment.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idを選択していないと購入できないこと' do
        @user_payment.prefecture_id = 0
        @user_payment.valid?
        expect(@user_payment.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityは空も購入できること' do
        @user_payment.city = ""
        @user_payment.valid?
        expect(@user_payment.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと購入できない' do
        @user_payment.address = ''
        @user_payment.valid?
        expect(@user_payment.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが12文字以上だと購入できないこと' do
        @user_payment.phone_number = "1" * 12
        @user_payment.valid?
        expect(@user_payment.errors.full_messages).to include("Phone number is the wrong length (should be 11 characters)")
      end
      it 'phone_numberが10文字以内だと購入できないこと' do
        @user_payment.phone_number = "1" * 10
        @user_payment.valid?
        expect(@user_payment.errors.full_messages).to include("Phone number is the wrong length (should be 11 characters)")
      end
      it '電話番号は英数字混合では登録できないこと' do
        @user_payment.phone_number = "1gA1skfu1"
        @user_payment.valid?
        expect(@user_payment.errors.full_messages).to include("Phone number is the wrong length (should be 11 characters)")
      end
      it 'tokenが空だと購入できないこと' do
        @user_payment.token = ""
        @user_payment.valid?
        expect(@user_payment.errors.full_messages).to include("Token can't be blank")
      end
      it 'building_nameは空でも保存できること' do
        @user_payment.building_name = nil
        expect(@user_payment).to be_valid
      end
    end
  end
end