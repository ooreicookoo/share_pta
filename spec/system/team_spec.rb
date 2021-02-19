require 'rails_helper'
RSpec.describe 'チーム管理機能', type: :system do
  describe '一覧表示機能' do
  before do
    #アドミンのログイン↓
    user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
    #アドミンの作ったチーム
    FactoryBot.create(:team, name:'name', owner_id: '1')
  end
    context 'アドミンユーザーがログインしているとき' do
     #アドミンユーザーでログインする↓
     before do
        visit user_session_path
        fill_in "メールアドレス", with: 'admin@gmail.com'
        fill_in "パスワード", with: 'password'
        click_button "ログイン"
      end
      # アドミンユーザーが作成したチームが表示される↓
      it '作成したチームが表示される' do
        expect(page).to have_content 'team'
      end
    end
  end
end
