require 'rails_helper'

RSpec.describe 'チーム管理機能', type: :system do
  describe '新規作成機能' do
    before do
      #アドミンのログイン↓
      FactoryBot.create(:admin_user)
      #アドミンの作ったチーム
      FactoryBot.create(:admin_team)
    end
    context 'アドミンがログインしているとき' do
      before do
        visit new_user_session_path
        fill_in "メールアドレス", with: 'admin@gmail.com'
        fill_in "パスワード", with: 'password'
        click_button "ログイン"
      end
      it 'アドミンが作成したチームが表示される' do
        expect(page).to have_content 'チーム一覧'
      end

      it 'アドミンが作成したチームと全てのチーム一覧が表示される' do
        expect(page).to have_content 'チーム一覧'
      end
    end

    context '任意のチーム詳細画面に遷移した場合' do
      it '該当のチーム詳細ページが表示される' do
        team = FactoryBot.create(:admin_team)
        visit teams_path(team.id)
        click_button "Show"
        expect(page).to have_content 'チーム詳細画面'
      end
    end

      # context 'リーダーがログインしているとき' do
      #   before do
      #       FactoryBot.create(:leader_user)
      #     visit new_user_session_path
      #     fill_in "メールアドレス", with: 'leader@gmail.com'
      #     fill_in "パスワード", with: 'password'
      #     click_button "ログイン"
      #   end

  end
end
