require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '必要事項を全て過不足なく入力すると登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailが重複すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailで@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが6文字未満では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが数字だけだと登録できない' do
        @user.password = '11111111'
        @user.password_confirmation = '11111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password パスワードには半角英字と半角数字の両方を含めて設定してください')
      end

      it 'passwordが英字だけだと登録できない' do
        @user.password = 'aaaaaaaa'
        @user.password_confirmation = 'aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password パスワードには半角英字と半角数字の両方を含めて設定してください')
      end

      it 'passwordが全角だと登録できない' do
        @user.password = 'ああああああ'
        @user.password_confirmation = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password パスワードには半角英字と半角数字の両方を含めて設定してください')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'bbb111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'お名前（全角）は、名字が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'お名前（全角）は、名前が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'お名前（全角）は、名字を全角（漢字･ひらがな･カタカナ）で入力しないと登録できない' do
        @user.first_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name は漢字・ひらがな・カタカナで入力してください')
      end

      it 'お名前（全角）は、名字を全角（漢字･ひらがな･カタカナ）で入力しないと登録できない' do
        @user.last_name = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name は漢字・ひらがな・カタカナで入力してください')
      end

      it 'お名前カナ（全角）は、名字が空では登録できない' do
        @user.first_name_yomi = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name yomi can't be blank")
      end

      it 'お名前カナ（全角）は、名前が空では登録できない' do
        @user.last_name_yomi = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name yomi can't be blank")
      end

      it 'お名前カナ(全角)は、名字を全角（カタカナ）で入力しないと登録できない' do
        @user.first_name_yomi = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name yomi 全角カタカナのみで入力して下さい')
      end

      it 'お名前カナ(全角)は、名前を全角（カタカナ）で入力しないと登録できない' do
        @user.last_name_yomi = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name yomi 全角カタカナのみで入力して下さい')
      end

      it '生年月日が空だと登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
