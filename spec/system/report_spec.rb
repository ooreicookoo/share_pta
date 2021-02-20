require 'rails_helper'

RSpec.describe 'レポート管理機能', type: :system do
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

      it 'アドミンが作成したレポートが表示される' do
        visit new_team_report(team.id)
        fill_in "test_report_title", with: 'report'
        fill_in "test_report_content", with: 'report'
        fill_in "2020-09-14 00:00:00", with: 'report'
        fill_in "test_report_place", with: 'report'
        click_button "Create Report"
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのレポート一覧が表示される' do
        report = FactoryBot.create(:team)
        visit team_reports_path(team.id)
        expect(page).to have_content 'report'
      end
    end
  end
  describe '詳細表示機能' do
     context '任意のレポート詳細画面に遷移した場合' do
       it '該当レポートの内容が表示される' do
         FactoryBot.create(:report)
        visit team_report_path(team.id, report.id)
        expect(page).to have_content 'team'
       end
     end
  end
end
