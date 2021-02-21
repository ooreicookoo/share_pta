require 'rails_helper'

RSpec.describe 'チーム管理機能', type: :system do
  describe 'チームを作ると同時にアサインされて表示される機能' do
    #任意のタスク詳細画面に遷移したとき、該当タスクの内容が表示される
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

      it 'アドミンが作成したチームが一覧に表示される' do
        admin_team = Team.find_by(name: FactoryBot.build(:admin_team).name)
        visit teams_path
        expect(
          find_by_id(
            "teams-index__teams--#{admin_team.id}"
          )
        ).to have_content admin_team.name
      end

      context 'アドミンが任意の詳細画面に遷移したとき' do
        it '該当タスクの内容が表示される' do
          admin_team = Team.find_by(name: FactoryBot.build(:admin_team).name)
          visit team_path(admin_team)
          expect(
            find_by_id(
              "teams-show__team_name"
            )
          ).to have_content admin_team.name
        end
      end

      context 'アドミンがチームをチームを作成したとき' do
        it 'アドミンもチームにアサインする' do
          admin_team = Team.find_by(name: FactoryBot.build(:admin_team).name)
          visit team_path(admin_team)
          expect(
            find_by_id(
              "teams-show__team_name"
            )
          ).to have_content admin_team.name
        end
      end
    end
  end
end
