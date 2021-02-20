require 'rails_helper'

RSpec.describe 'チーム管理機能', type: :system do
  describe '一覧表示機能' do
    #各種権限ユーザーログイン↓
    let(:admin_user) { FactoryBot.create(:admin_user) }
    let(:leader_user) { FactoryBot.create(:leader_user) }
    let(:user) { FactoryBot.create(:user) }

    before do
      FactoryBot.create(:admin_team)
      visit new_user_session_path
      fill_in "メールアドレス", with: 'login_user.email'
      fill_in "パスワード", with: 'login_user.password'
      click_button "ログイン"
    end

    context 'アドミンがログインしているとき' do
      let(:login_user) { admin_user }

      it 'アドミンが作成したチームが表示される' do
        expect(page).to have_content '最初のチーム名_by_admin'
      end
    end

    context 'リーダーがログインしているとき' do
      let(:login_user) { leader_user }

      it 'アドミンが作成したチームが表示されない' do
        expect(page).to have_no_content '最初のチーム名_by_admin'
      end
    end
  end
end
