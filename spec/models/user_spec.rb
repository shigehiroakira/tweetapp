require 'rails_helper'

RSpec.describe User, type: :model do
before do
  @user = FactoryBot.build(:user)
end

  describe "新規登録について" do
    context "新規登録ができるとき" do
      it "全ての情報が入っていれば新規登録できる"do
        expect(@user).to be_valid
      end
    end
    context "新規登録がうまくいかないとき"do
      it "nicknameが空だと登録できない"do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      
      end
      it "last_nameが空だと登録できない"do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      
      end

      it "last_nameがローマ字で入力されていると登録できない"do
        @user.last_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角ひらがな・カタカナ・漢字で入力してください")
      end

      it "last_name_kanaが空だと登録できない"do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      
      end

      it "last_name_kanaがひらがなで入力されていると登録できない"do
        @user.last_name_kana = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カタカナで入力してください")
      end

      it "last_name_kanaがローマ字で入力されていると登録できない"do
        @user.last_name_kana ="aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カタカナで入力してください")
      end



      it "first_nameが空だと登録できない"do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "first_nameがローマ字で入力されていると登録できない"do
      @user.first_name ="aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角ひらがな・カタカナ・漢字で入力してください")
      end

      it "first_name_kanaが空だと登録できない"do
      @user.first_name_kana =nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
        
      end

      it "first_name_kanaがひらがなで入力されていると登録できない"do
      @user.first_name_kana ="あああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角カタカナで入力してください")
      end

      it "first_name_kanaがローマ字で入力されていると登録できない"do
      @user.first_name_kana ="aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角カタカナで入力してください")
      end

      it "birthdayが空だと登録できない"do
       @user.birthday = nil
       @user.valid?
       expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it "emailが空だと登録できない"do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailだと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスに@が含まれないと保存できない' do
        @user.email = 'sample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it "passwordが空だと登録できない"do
       @user.password =nil
       @user.valid?
       expect(@user.errors.full_messages).to include("Password can't be blank")
        
      end

      it "passwordが全角だと登録できない"do
      @user.password = "あああ１１１"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
       
      end

      it "passwordが英数字混同でないと登録できない"do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
       
      end

      it "passwordが5文字以下だと登録できない"do
      @user.password = "aa111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
       
      end

      it "password_confirmationがないと登録できない"do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
       
      end


    end
  end
end
