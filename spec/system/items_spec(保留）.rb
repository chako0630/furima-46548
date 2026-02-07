require 'rails_helper'

RSpec.describe Item, type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  describe '商品出品' do
    it '価格を入力すると、販売手数料と販売利益が表示される' ,js: true do
      sign_in @user 
      visit new_item_path
      fill_in 'item-price', with: 1000
      expect(page).to have_content('100') # 手数料
      expect(page).to have_content('900') # 利益
    end

    it '価格が300円のとき、手数料は30円、利益は270円であること' do
      sign_in @user 
      visit new_item_path
      fill_in 'item-price', with: 300
      expect(page).to have_content('30') # 手数料
      expect(page).to have_content('270') # 利益
    end

    it '価格が499円のとき、手数料が49円（切り捨て）であること' do        
      sign_in @user 
      visit new_item_path
      fill_in 'item-price', with: 499
      expect(page).to have_content('49') # 手数料
      expect(page).to have_content('450') # 利益
    end
  end

end
