require 'rails_helper'

RSpec.describe 'チーム管理機能', type: :system do
  describe '詳細ページ表示機能' do
    #任意のタスク詳細画面に遷移したとき、該当タスクの内容が表示される
    before do
      FactoryBot.create(:leader_user) #リーダーのログイン
      FactoryBot.create(:leader_team) #リーダーの作ったチーム
    end

    context 'リーダーがログインしているとき' do
      before do
        visit new_user_session_path
        fill_in "sessions-new__email", with: FactoryBot.build(:leader_user).email
        fill_in "sessions-new__password", with: FactoryBot.build(:leader_user).password
        click_button "sessions-new__submit"
        visit teams_path
      end

      it 'リーダーが作成したチームが一覧に表示される' do
        leader_team = Team.find_by(name: FactoryBot.build(:leader_team).name)
        visit teams_path
        expect(
          find_by_id(
            "teams-index__teams--#{leader_team.id}"
          )
        ).to have_content leader_team.name
      end

      context 'リーダーが任意の詳細画面に遷移したとき' do
        it '該当チームの内容が表示される' do
          leader_team = Team.find_by(name: FactoryBot.build(:leader_team).name)
          visit team_path(leader_team)
          expect(
            find_by_id(
              "teams-show__team_name"
            )
          ).to have_content leader_team.name
        end
      end
      context 'リーダーがチームをチームを作成したとき' do
        it 'リーダーもチームにアサインし表示される' do
          leader_team = Team.find_by(name: FactoryBot.build(:leader_team).name)
          visit team_path(leader_team)
          expect(
            find_by_id(
              "teams-show__team_name"
            )
          ).to have_content leader_team.name
        end
      end
    end
  end
end

# def team_path(model = nil, id: nil)
#   if id == nil
#     id = model.id
#   end
#   # /teams/:id
#   return "/teams/#{id}"
# end
