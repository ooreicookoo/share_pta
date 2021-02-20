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
          FactoryBot.create(:admin_user)
          visit new_user_session_path
          fill_in "メールアドレス", with: 'admin@gmail.com'
          fill_in "パスワード", with: 'password'
          click_button "ログイン"
        end

      context 'リーダーがログインしているとき' do
        before do
            FactoryBot.create(:leader_user)
          visit new_user_session_path
          fill_in "メールアドレス", with: 'leader@gmail.com'
          fill_in "パスワード", with: 'password'
          click_button "ログイン"
        end

        #↓アドミン用の記述
        it 'アドミンが作成したチームがリーダのページには表示されない' do
          expect(page).to have_no_content 'チーム一覧'
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
  end
