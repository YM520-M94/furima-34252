require 'rails_helper'

RSpec.describe PurchaserAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      product = FactoryBot.create(:product)
      @purchaser_address = FactoryBot.build(:purchaser_address, user_id: user.id, product_id: product.id)
      sleep 0.1 
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchaser_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchaser_address.building_name = ''
        expect(@purchaser_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @purchaser_address.postal_code = ''
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchaser_address.postal_code = '1234567'
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @purchaser_address.prefecture_id = 1
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @purchaser_address.city = ''
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だと保存できないこと' do
        @purchaser_address.block = ''
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'tokenが空だと保存できないこと' do
        @purchaser_address.token = nil
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @purchaser_address.phone_number = ''
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが11桁以上だと保存できないこと' do
        @purchaser_address.phone_number = '09011112222333'
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include("Phone number Phone Number is too long (maximum is 11 characters)")
      end
      it 'phone_numberが数字以外だと保存できないこと' do
        @purchaser_address.phone_number = 'aaaaaaaaa'
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include("Phone number Phone Number is too long (maximum is 11 characters)")
      end
      it 'phone_numberが全角数字だと保存できないこと' do
        @purchaser_address.phone_number = '０９０１１１１２２２２'
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include("Phone number Phone Number is too long (maximum is 11 characters)")
      end
      it 'productが紐付いていないと保存できないこと' do
        @purchaser_address.product_id = nil
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include("Product can't be blank")
      end

      it 'userが紐付いていないと保存できないこと' do
        @purchaser_address.user_id = nil
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
