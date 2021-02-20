require 'rails_helper'

RSpec.describe 'ログイン機能', type: :system do
  describe '一覧表示機能' do
    before do
      #アドミンのログイン↓
      user_a = FactoryBot.create(:leader_user)
      #アドミンの作ったチーム
      # FactoryBot.create(:team)
    end
    context 'リーダーユーザーがログインすると' do
     #アドミンユーザーでログインする↓
     before do
        visit new_user_session_path
        fill_in "メールアドレス", with: 'leader@gmail.com'
        fill_in "パスワード", with: 'password'
        click_button "ログイン"
      end
      # アドミンユーザーが作成したチームが表示される↓
      it 'ログインが成功したらtopページが開く' do
        expect(page).to have_content 'ABOUT : share work PTA'
      end
    end
  end
end
