require 'rails_helper'

RSpec.describe 'レポート機能', type: :system do
  describe 'レポート作成機能' do
    #任意のタスク詳細画面に遷移したとき、該当タスクの内容が表示される
    before do
      FactoryBot.create(:admin_user) #アドミンのログイン
      FactoryBot.create(:admin_team) #アドミンの作ったチーム
      FactoryBot.create(:report)
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

      context 'アドミンが任意のチーム詳細画面に遷移したとき' do
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

      context '該当チームからレポート新規作成した場合' do
        it '作成したレポートが一覧表示され、負担指数のグラフが見られる' do
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

      context 'アドミンが任意のレポート詳細画面に遷移したとき' do
        it '該当レポートの内容が表示される' do
          admin_team = Team.find_by(name: FactoryBot.build(:admin_team).name)
          report = Report.last
          visit team_report_path(admin_team, report)
          expect(
            find_by_id(
              "report-show_index"
            )
          ).to have_content 'レポート詳細画面'
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
