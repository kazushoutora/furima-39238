require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品機能' do
      context '商品出品できる場合' do
        it '必要事項を全て過不足なく入力すると出品できる' do
          expect(@item).to be_valid
        end
      end
      context '商品出品できない場合' do
        it '画像が空では出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it '商品名が空では出品できない' do
          @item.item_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank")
        end

        it '商品の説明が空では出品できない' do
          @item.item_description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item description can't be blank")
        end

        it '商品のカテゴリーに「---」が選択されている場合は出品できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end

        it '商品の状態に「---」が選択されている場合は出品できない' do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition can't be blank")
        end

        it '配送料の負担に「---」が選択されている場合は出品できない' do
          @item.delivery_charge_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
        end

        it '発送元の地域に「---」が選択されている場合は出品できない' do
          @item.delivery_from_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery from can't be blank")
        end

        it '発送までの日数に「---」が選択されている場合は出品できない' do
          @item.delivery_time_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery time can't be blank")
        end

        it '価格が空では出品できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it '価格に半角数字以外が含まれている場合は出品できない' do
          @item.price = '５０００'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number')
        end

        it '販売価格が¥300より少ないと出品できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
        end

        it '販売価格が¥9999999より少ないと出品できない' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
        end

        it 'ユーザーが紐付いていなければ投稿できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('User must exist')
        end
      end
    end
  end
end
