require 'rails_helper'

RSpec.describe 'チーム管理機能', type: :system do
  describe '新規作成機能' do
    before do
      FactoryBot.create(:admin_user) #アドミンのログイン
      FactoryBot.create(:admin_team) #アドミンの作ったチーム
    end

    context 'アドミンがログインしているとき' do
      before do
        visit new_user_session_path
        fill_in "sessions-new__email", with: FactoryBot.build(:admin_user).email
        fill_in "sessions-new__password", with: FactoryBot.build(:admin_user).password
        click_button "sessions-new__submit"
        visit teams_path
      end
      it 'アドミンが作成したチームがリーダのページには表示される' do
        admin_team = Team.find_by(name: FactoryBot.build(:admin_team).name)
        expect(
          find_by_id(
            "teams-index__teams--#{admin_team.id}"
          )
        ).to have_content admin_team.name
      end
    end

    context 'リーダーがログインしているとき' do
      before do
        visit new_user_session_path
        fill_in "sessions-new__email", with: FactoryBot.build(:admin_user).email
        fill_in "sessions-new__password", with: FactoryBot.build(:admin_user).password
        click_button "sessions-new__submit"
        visit teams_path
      end
      #↓アドミン用の記述
      it 'アドミンが作成したチームがリーダのページには表示されない' do
        admin_team = Team.find_by(name: FactoryBot.build(:admin_team).name)
        expect(
          find_by_id(
            "teams-index__teams--#{admin_team.id}"
          )
        ).to have_content admin_team.name
      end
    end
  end
end
