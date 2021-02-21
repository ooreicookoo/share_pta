require 'rails_helper'
RSpec.describe 'アサイン招待機能', type: :system do
  # 招待したい会員登録のユーザーをメール送信を押すと「送信しました」と出る
  before do
    FactoryBot.create(:admin_user) #アドミンのログイン
    FactoryBot.create(:admin_team) #アドミンの作ったチーム
  end
  describe '招待機能' do
    it 'アドミンが作成したチームの招待ページ' do
      context '招待したい会員登録済のユーザーにメール送信した場合' do
        it '「チームに招待するメールを送信しました」と表示される' do
          visit invite_team_path(team.id)
          fill_in "team-invite__mail", with: FactoryBot.build(:user).email
          click_button "登録"
          expect(page).to have_content 'task'
        end
      end
  end
end
