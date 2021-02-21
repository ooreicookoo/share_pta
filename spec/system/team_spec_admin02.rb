require 'rails_helper'

RSpec.describe 'チーム管理機能', type: :system do
  describe '詳細ページ表示機能' do
    #任意のタスク詳細画面に遷移したとき、該当タスクの内容が表示される
    before do
      FactoryBot.create(:admin_user) #アドミンのログイン
      FactoryBot.create(:admin_team) #アドミンの作ったチーム
      end

    context 'アドミンがログインしているとき' do
      before do
        visit new_user_session_path
        fill_in "メールアドレス", with: 'admin@gmail.com'
        fill_in "パスワード", with: 'password'
        click_button "ログイン"
      end

      it 'アドミンが作成したチームが一覧に表示される' do
        visit new_team_path
          expect(page).to have_content 'チーム一覧'
      end

    context 'リーダーがログインしているとき' do
      let(:login_user) { leader_user }

      it 'アドミンが作成したチームが表示されない' do
        expect(page).to have_no_content '最初のチーム名_by_admin'
      end
    end
  end
end
