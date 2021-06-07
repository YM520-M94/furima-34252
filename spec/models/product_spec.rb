require 'rails_helper'
RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品登録' do

    context '商品出品登録できるとき' do

      it '全ての項目の入力が存在すれば登録できる' do
        expect(@product).to be_valid
      end

      it '販売価格が￥300の場合は登録できる' do
        @product.price = 300
        expect(@product).to be_valid
      end
      it '販売価格が￥9999999の場合は登録できる' do
        @product.price = 9999999
        expect(@product).to be_valid
      end
      it '販売価格が半角数字の場合は登録できる' do
        @product.price = 500
        expect(@product).to be_valid
      end

    end

    context '商品出品登録できないとき' do

      it '商品画像がない場合は登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がない場合は登録できない' do
        @product.product = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product can't be blank")
      end
      it '商品説明の情報がない場合は登録できない' do
        @product.listing_person = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Listing person can't be blank")
      end

      it '販売価格がない場合は登録できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格は半角数字のみ保存可能であること' do
        @product.price = 'abcdef'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
      it '販売価格が￥299の場合は登録できない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than 299")

      end
      it '販売価格が￥10000000の場合は登録できない' do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be less than 10000000")
      end

      it 'カテゴリーの情報が空では登録できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品の状態についての情報が空では登録できない' do
        @product.product_state_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Product state must be other than 1")
      end
      it '配送料の負担についての情報が空では登録できない' do
        @product.product_state_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Product state must be other than 1")
        
      end
      it '発送元の地域についての情報が空では登録できない' do
        @product.product_state_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Product state must be other than 1")
      end
      it '発送までの日数についての情報が空では登録できない' do
        @product.product_state_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Product state must be other than 1")
      end
      it 'ログイン状態(userが紐付いていない)でないと保存できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("User must exist")
      end
    end
  end
end
