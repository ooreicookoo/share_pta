require 'rails_helper'
RSpec.describe 'レポート機能', type: :model do
    before do
      @report = FactoryBot.create(:report)
    end

  describe 'バリデーションのテスト' do
    context 'reportのtitleが空の場合' do
      it 'バリデーションにひっかる' do
        @report = Report.new(title: '')
        expect(@report).not_to be_valid
      end
    end

    context 'reportのtimeが空の場合' do
      it 'バリデーションにひっかる' do
        @report = Report.new(time: '')
        expect(@report).not_to be_valid
      end
    end

    context 'reportのcontentが空の場合' do
      it 'バリデーションにひっかる' do
        @report = Report.new(content: '')
        expect(@report).not_to be_valid
      end
    end

    context 'reportのdateが空の場合' do
      it 'バリデーションにひっかる' do
        @report = Report.new(date: '')
        expect(@report).not_to be_valid
      end
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
