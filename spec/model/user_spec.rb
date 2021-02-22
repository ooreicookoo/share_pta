require 'rails_helper'
RSpec.describe 'ユーザー機能', type: :model do
    before do
      @user = FactoryBot.create(:user)
    end

  describe 'バリデーションのテスト' do
    context 'userのnameが空の場合' do
      it 'バリデーションにひっかる' do
        @user = User.new(name: '')
        expect(@user).not_to be_valid
      end
    end

    context 'userのemailが空の場合' do
      it 'バリデーションにひっかる' do
        @user = User.new(email: '')
        expect(@user).not_to be_valid
      end
    end

    context 'userのemailが空の場合' do
      it 'バリデーションにひっかる' do
        @user = User.new(email: '')
        expect(@user).not_to be_valid
      end
    end

    context 'userのemailが重複した場合' do
      it 'バリデーションにひっかる' do
        @user = User.new(email: '')
        @user1 = User.new(email: '')
        expect(@user).not_to be_valid
      end
    end

    context 'userのschool_yearが空の場合' do
      it 'バリデーションにひっかる' do
        @user = User.new(school_year: '')
        expect(@user).not_to be_valid
      end
    end

    context 'userのschool_classが空の場合' do
      it 'バリデーションにひっかる' do
        @user = User.new(school_class: '')
        expect(@user).not_to be_valid
      end
    end

  end
    # context 'Productのpriceが空の場合' do
    #   it 'バリデーションにひっかかる' do
    #     @product2 = Product.new(name: 'test_title2',price: '',picture: 'spec/fixtures/test.jpg',user: @user)
    #     expect(@product2).not_to be_valid
    #   end
    # end
    #  context 'Productのpictureと詳細に内容が記載されている場合' do
    #    it 'バリデーションにひっかかる' do
    #      @product3 = Product.new(name: 'test_title3',price: '10000',picture: '',user: @user)
    #      expect(@product3).not_to be_valid
    #    end
    #  end
    #  context 'Productのpictureとnameとprice詳細に内容が記載されている場合' do
    #    it 'バリデーションが通る' do
    #      #@product4 = Product.new(name: 'test_title4',price: '10000',picture: 'spec/fixtures/test.jpg',user: @user)
    #      expect(@product1).to be_valid
    #    end
    #  end
  end
