require 'rails_helper'

RSpec.describe 'アサイン〜レポート投稿機能', type: :system do
  describe '招待機能' do
    #任意のタスク詳細画面に遷移したとき、該当タスクの内容が表示される
    before do
      FactoryBot.create(:admin_user) #アドミンのログイン
      FactoryBot.create(:user) #アドミンのログイン
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
        it '該当チームの内容が表示される' do
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
        it 'アドミンもチームにアサインし表示される' do
          admin_team = Team.find_by(name: FactoryBot.build(:admin_team).name)
          visit team_path(admin_team)
          expect(
            find_by_id(
              "teams-show__team_name"
            )
          ).to have_content admin_team.name
        end
      end

      context 'アドミンが招待したい会員登録済のユーザーにメール送信した場合' do
        it '「チームに招待するメールを送信しました」と表示される' do
          admin_team = Team.find_by(name: FactoryBot.build(:admin_team).name)
          visit invite_team_path(admin_team)
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
          admin_team = Team.find_by(name: FactoryBot.build(:admin_team).name)
          visit invite_team_path(admin_team)
          fill_in "team-invite__mail", with: FactoryBot.build(:user).email
          visit team_path(admin_team)
          expect(
            find_by_id(
              "teams-show__team_name"
            )
          ).to have_content admin_team.name
        end
      end

      context 'ユーザーが任意の詳細画面に遷移したとき' do
        it '該当チームの内容が表示される' do
          admin_team = Team.find_by(name: FactoryBot.build(:admin_team).name)
          visit team_path(admin_team)
          expect(
            find_by_id(
              "teams-show__team_name"
            )
          ).to have_content admin_team.name
        end
      end

      context '該当チームからユーザーレポート新規作成した場合' do
        it '「作成したレポートが一覧表示される」' do
          admin_team = Team.find_by(name: FactoryBot.build(:admin_team).name)
          visit new_team_report_path(admin_team)
          fill_in "reports-form__title", with: FactoryBot.build(:report).title
          fill_in "reports-form__content", with: FactoryBot.build(:report).content
          fill_in "reports-form__time", with: FactoryBot.build(:report).time
          click_button "reports-form__submit"
          click_button "reports--confirm__submit"
          report = Report.last
          # nil = !!nil => false
          # 1 = !!1 => true
          # expect(
          #   !!find_by_id(
          #     "reports-index__reports--#{report.id}"
          #   )
          # ).to be true
          expect(
            find_by_id(
              "reports-index__reports--#{report.id}__title"
            )
          ).to have_content report.title
          expect(
            find_by_id(
              "reports-index__reports--#{report.id}__user"
            )
          ).to have_content report.user.name
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
