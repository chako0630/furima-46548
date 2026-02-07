require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できる場合' do
      it '項目全てが存在すれば出品できる' do
        expect(@item).to be_valid
      end

      it 'priceが半角数字であれば出品できる' do
        @item.price = '3000'
        expect(@item).to be_valid
      end

      it 'category_idが1以外なら保存できる' do
        @item.category_id = 2 
        expect(@item).to be_valid
      end

      it 'item_status_idが1以外なら保存できる' do
        @item.item_status_id = 2 
        expect(@item).to be_valid
      end

      it 'shipping_fee_idが1以外なら保存できる' do
        @item.shipping_fee_id = 2 
        expect(@item).to be_valid
      end

      it 'prefecture_idが1以外なら保存できる' do
        @item.prefecture_id = 2 
        expect(@item).to be_valid
      end

      it 'shipping_day_idが1以外なら保存できる' do
        @item.shipping_day_id = 2 
        expect(@item).to be_valid
      end

    end

    context '出品できない場合' do

      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'item_nameが空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'descriptionが空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが300円未満では出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end     

      it 'priceが9,999,999円より大きいと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end 

      it 'priceに全角文字が含まれていると出品できない' do
        @item.price = '３０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'category_idが1（---）だと保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'item_status_idが1（---）だと保存できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end

      it 'shipping_fee_idが1（---）だと保存できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end

      it 'prefecture_idが1（---）だと保存できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'shipping_day_idが1（---）だと保存できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
  
    end
  end
end