require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe '購入記録の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @buy_address = FactoryBot.build(:buy_address, user_id: @user.id, item_id: @item.id)
      @buy_address.price = @item.price
    end

    context '購入内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@buy_address).to be_valid
      end
      it 'building_nameは空でも購入できること' do
        @buy_address.building_name = ''
        expect(@buy_address).to be_valid
      end

      it 'priceとtokenがあれば購入ができること' do
        expect(@buy_address).to be_valid
      end
    end

    context '購入内容に問題がある場合' do
      it '郵便番号が空だと保存できないこと' do
        @buy_address.postal_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号が『3桁ハイフン4桁』半角数字でないと購入できない' do
        @buy_address.postal_code = '1235678'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Postal code は『3桁ハイフン4桁』半角数字で入力してください')
      end

      it '都道府県に「---」が選択されている場合は購入できない' do
        @buy_address.delivery_from_id = 1
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Delivery from can't be blank")
      end

      it '市区町村が空だと購入できない' do
        @buy_address.municipality = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it '番地が空だと購入できない' do
        @buy_address.house_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("House number can't be blank")
      end

      it '電話番号が空だと購入できない' do
        @buy_address.telephone_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Telephone number can't be blank")
      end

      it '電話番号が9桁以下だと購入できないこと' do
        @buy_address.telephone_number = '0901212'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Telephone number は10桁以上11桁以内で入力してください')
      end

      it '電話番号が12桁以上だと購入できないこと' do
        @buy_address.telephone_number = '090121234345'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Telephone number は10桁以上11桁以内で入力してください')
      end

      it '電話番号が全角数字だと購入できない' do
        @buy_address.telephone_number = '０９０７８７８１２３４'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Telephone number は10桁以上11桁以内で入力してください')
      end

      it 'user_idが紐づいていなければ購入できないこと' do
        @buy_address.user_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが紐づいていなければ購入できないこと' do
        @buy_address.item_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では購入できない' do
        @buy_address.token = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
