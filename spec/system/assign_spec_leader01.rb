require 'rails_helper'

RSpec.describe 'アサイン招待機能', type: :system do
  describe '招待機能' do
    #任意のタスク詳細画面に遷移したとき、該当タスクの内容が表示される
    before do
      FactoryBot.create(:leader_user) #リーダーのログイン
      FactoryBot.create(:user) #リーダーのログイン
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

      context 'リーダーが招待したい会員登録済のユーザーにメール送信した場合' do
        it '「チームに招待するメールを送信しました」と表示される' do
          leader_team = Team.find_by(name: FactoryBot.build(:leader_team).name)
          visit invite_team_path(leader_team)
          fill_in "team-invite__mail", with: FactoryBot.build(:user).email
          click_button "team-invite__submit"
          expect(page).to have_content 'チームに招待するメールを送信しました'
        end
      end

      context 'チームに招待されたユーザーがログインしているとき' do
        before do
          visit new_user_session_path
          fill_in "sessions-new__email", with: FactoryBot.build(:user).email
          fill_in "sessions-new__password", with: FactoryBot.build(:user).password
          click_button "sessions-new__submit"
          visit teams_path
        end
      end

      context 'ユーザーがチームにアサインした場合' do
        it 'チーム一覧に名前が表示される' do
          leader_team = Team.find_by(name: FactoryBot.build(:leader_team).name)
          visit invite_team_path(leader_team)
          fill_in "team-invite__mail", with: FactoryBot.build(:user).email
          visit team_path(leader_team)
          expect(
            find_by_id(
              "teams-show__team_name"
            )
          ).to have_content leader_team.name
        end
      end

      context 'ユーザーがチームにアサインしていない場合' do
        it 'チーム一覧にユーザーの名前が表示されない' do
         user = User.find_by(name: FactoryBot.build(:user))
          visit root_path
          click_link "sessions-logout__part"
          visit new_user_session_path
          fill_in "sessions-new__email", with: FactoryBot.build(:leader_user).email
          fill_in "sessions-new__password", with: FactoryBot.build(:leader_user).password
          click_button "sessions-new__submit"
          visit teams_path
        end
      end
        it 'チーム一覧にユーザーの名前が表示されない' do
          leader_team = Team.find_by(name: FactoryBot.build(:leader_team).name)
          visit teams_path
          expect(
            find_by_id(
              "teams-index__teams--#{leader_team.id}"
            )
          ).to have_content leader_team.name
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
