require 'rails_helper'

RSpec.describe 'チーム管理機能', type: :system do
  describe '新規作成機能' do
      before do
        #アドミンのログイン↓
        FactoryBot.create(:admin_user)
        #アドミンの作ったチーム
        FactoryBot.create(:team)
      end
      context 'アドミンがログインしているとき' do
        before do
          visit new_user_session_path
          fill_in "メールアドレス", with: 'admin@gmail.com'
          fill_in "パスワード", with: 'password'
          click_button "ログイン"
        end

      it 'アドミンが作成したチームと全てのチーム一覧が表示される' do
        # visit new_team_path
        expect(page).to have_content 'チーム一覧'
      end

      context '任意のチーム詳細画面に遷移した場合' do
        before do
          visit team_path(team.id)
          click_button "show"
          expect(page).to have_content 'チーム詳細画面'
        end
      end
    end
  end
end
