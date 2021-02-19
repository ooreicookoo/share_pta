require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :model do
    describe 'ユーザー登録' do
     it "name、email、passwordとpassword_confirmationが存在すれば登録できること" do
       user = build(:user)
       expect(user).to be_valid  # user.valid? が true になればパスする
     end
   end
end
