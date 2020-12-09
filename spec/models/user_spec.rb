require 'rails_helper'

describe User do
  describe '#create' do

    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it "名前, カナ名, 誕生日, ニックネーム, email, パスワード
        が存在すれば登録できること" do
        expect(@user).to be_valid
        end
      end
  
      context '新規登録がうまくいかないとき' do
        it "nicknameが空だと登録できない" do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it "nicknameが6文字以下であれば登録できない" do
          @user.nickname = "aaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 6 characters)")
        end
        it "emailが空では登録できない" do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it "重複したemailが存在する場合登録できない" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
        it "passwordが空では登録できない" do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it "passwordが6文字以下であれば登録できない" do
          @user.password = "00000"
          @user.password_confirmation = "00000"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        it "passwordが存在してもpassword_confirmationが空では登録できない" do
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "first_nameは漢字・平仮名・カタカナ以外では登録できないこと" do
          @user.first_name_kana = "aaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("can't be blank")
        end
        it "last_nameは漢字・平仮名・カタカナ以外では登録できないこと" do
          @user.first_name_kana = "aaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("can't be blank")
        end
        it "パスワードが半角英語のみでは登録できないこと" do
          @user.password = "fffff"
          @user.valid?
          expect(@user.errors.full_messages).to include("doesn't match Password")
        end
        it "パスワードが半角数字のみでは登録できないこと" do
          @user.password = 22222
          @user.valid?
          expect(@user.errors.full_messages).to include("doesn't match Password")
        end
        it "パスワードが全角では登録できないこと" do
          @user.password = "AAAA2222"
          @user.valid?
          expect(@user.errors.full_messages).to include("doesn't match Password")
        end
        it "birth_dayがない場合は登録できないこと" do
          @user.birth_day = ""
          @user.valid?
          expect(user.errors[:birthday]).to include("can't be blank")
        end
      end
    end
  end