require 'rails_helper'

RSpec.describe OrderHistoryShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_history_shipping = FactoryBot.build(:order_history_shipping, user_id: user.id, item_id: item.id)
  end

  describe '購入情報の保存' do
    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_history_shipping).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_history_shipping.building = ''
        expect(@order_history_shipping).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postscriptが空では保存ができないこと' do
        @order_history_shipping.postscript = nil
        @order_history_shipping.valid?
        expect(@order_history_shipping.errors.full_messages).to include("Postscript can't be blank")
      end
      it 'postscriptが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_history_shipping.postscript = '1234567'
        @order_history_shipping.valid?
        expect(@order_history_shipping.errors.full_messages).to include('Postscript is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_history_shipping.prefecture_id = 1
        @order_history_shipping.valid?
        expect(@order_history_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では保存できないこと' do
        @order_history_shipping.city = nil
        @order_history_shipping.valid?
        expect(@order_history_shipping.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空では保存できないこと' do
        @order_history_shipping.house_number = nil
        @order_history_shipping.valid?
        expect(@order_history_shipping.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空では保存できないこと' do
        @order_history_shipping.phone_number = nil
        @order_history_shipping.valid?
        expect(@order_history_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角数字のみでないと保存できないこと' do
        @order_history_shipping.phone_number = '０９０１２３４５６７８'
        @order_history_shipping.valid?
        expect(@order_history_shipping.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが11桁以内でないと保存できないこと' do
        @order_history_shipping.phone_number = '090123456789'
        @order_history_shipping.valid?
        expect(@order_history_shipping.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが9桁以下では保存できないこと' do
        @order_history_shipping.phone_number = '090123456'
        @order_history_shipping.valid?
        expect(@order_history_shipping.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberがハイフン付きでは保存できないこと' do
        @order_history_shipping.phone_number = '090-1234-5678'
        @order_history_shipping.valid?
        expect(@order_history_shipping.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空では保存できないこと' do
        @order_history_shipping.token = nil
        @order_history_shipping.valid?
        expect(@order_history_shipping.errors.full_messages).to include("Token can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_history_shipping.item_id = nil
        @order_history_shipping.valid?
        expect(@order_history_shipping.errors.full_messages).to include("Item can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_history_shipping.user_id = nil
        @order_history_shipping.valid?
        expect(@order_history_shipping.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
