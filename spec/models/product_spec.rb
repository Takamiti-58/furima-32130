require 'rails_helper'

describe Product do
  describe '#create' do
    before do
      @product = FactoryBot.build(:product)
    end

    describe '商品出品' do
      context '商品出品がうまくいくとき' do
        it "商品名、その他諸々が存在すれば出品できる" do
        expect(@product).to be_valid
        end
      end
  
      context '商品出品がうまくいかないとき' do
        it "nameが空だと出品できない" do
          @product.name = ""
          @product.valid?
          expect(@product.errors.full_messages).to include("Name can't be blank")
        end
        it "商品説明が空では出品できない" do
          @product.description = ""
          @product.valid?
          expect(@product.errors.full_messages).to include("Description can't be blank")
        end
        it "カテゴリーが1だと出品できない" do
          @product.category_id = 1
          @product.valid?
          expect(@product.errors.full_messages).to include("Category must be other than 1")
        end
        it "商品の状態が1だと出品できない" do
          @product.status_id = 1
          @product.valid?
          expect(@product.errors.full_messages).to include ("Status must be other than 1")
        end
        it "配送料の負担が1だと出品できない" do
          @product.shipping_cost_id = 1
          @product.valid?
          expect(@product.errors.full_messages).to include("Shipping cost must be other than 1")
        end
        it "配送元の地域が1だと出品できない" do
          @product.prefecture_id = 1
          @product.valid?
          expect(@product.errors.full_messages).to include("Prefecture must be other than 1")
        end
        it "配送日が1だと出品できない" do
          @product.shipping_days_id = 1
          @product.valid?
          expect(@product.errors.full_messages).to include("Shipping days must be other than 1")
        end
        it "価格が空だと出品できない" do
          @product.price = ""
          @product.valid?
          expect(@product.errors.full_messages).to include("Price can't be blank")
        end
        it "商品の画像が空だと出品できない" do
          @product.image = nil
          @product.valid?
          expect(@product.errors.full_messages).to include("Image can't be blank")
        end
        it "nameが41文字以内であること" do
          @product.name = "a" * 41
          @product.valid?
          expect(@product.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
        end
        it "商品説明が1001文字以上だと出品できない" do
          @product.description = "a" * 1001
          @product.valid?
          expect(@product.errors.full_messages).to include("Description is too long (maximum is 1000 characters)")
        end
        it "priceが299円以下だと出品できない" do
          @product.price = 299
          @product.valid?
          expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
        end
    
        it "priceが10000000円以上だと出品できない" do
          @product.price = 10000000
          @product.valid?
          expect(@product.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end
      end
    end
  end
end