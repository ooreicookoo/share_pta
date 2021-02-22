require 'rails_helper'

RSpec.describe 'レポートコメント機能', type: :system do
  describe 'レポート作成機能' do
    #任意のタスク詳細画面に遷移したとき、該当タスクの内容が表示される
    before do
      FactoryBot.create(:leader_user) #リーダーのログイン
      FactoryBot.create(:leader_team) #リーダーの作ったチーム
      FactoryBot.create(:report)
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

      context '該当チームからレポート新規作成した場合' do
        it '「作成したレポートが一覧表示される」' do
          leader_team = Team.find_by(name: FactoryBot.build(:leader_team).name)
          visit new_team_report_path(leader_team)
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

      context 'リーダーが任意のレポート詳細画面に遷移したとき' do
        it '該当レポートの内容が表示される' do
          leader_team = Team.find_by(name: FactoryBot.build(:leader_team).name)
          report = Report.last
          visit team_report_path(leader_team, report)
          expect(
            find_by_id(
              "report-show_index"
            )
          ).to have_content 'レポート詳細画面'
        end
      end

      context 'リーダーが任意のレポート詳細画面に遷移したとき' do
        it 'コメントを投稿出来る' do
          leader_team = Team.find_by(name: FactoryBot.build(:leader_team).name)
          report = Report.last
          visit team_report_path(leader_team, report)
          fill_in "reports-comment-form__comment", with: FactoryBot.build(:report_comment).comment_content
          click_button "reports-coment-form__comment_submit"
          expect(
            find_by_id(
              "reports-coment-form__comment_title"
            )
          ).to have_content 'コメント'
        end
      end

      context 'リーダーが任意のレポート削除画面に遷移したとき' do
        it 'コメントを削除出来る' do
          leader_team = Team.find_by(name: FactoryBot.build(:leader_team).name)
          report = Report.last
          visit team_report_path(leader_team, report)
          fill_in "reports-comment-form__comment", with: FactoryBot.build(:report_comment).comment_content
          click_button "reports-coment-form__comment_submit"
          report_comment= ReportComment.last
          visit team_report_path(leader_team, report, report_comment)
          click_on "reports-comment_form__delete"
          page.driver.browser.switch_to.alert.accept
          expect(
            find_by_id(
              "reports-coment-form__comment_title"
            )
          ).to have_content "コメント"
        end
      end

      context 'リーダーが任意のレポート削除画面に遷移したとき' do
        it 'コメントを削除出来る' do
          leader_team = Team.find_by(name: FactoryBot.build(:leader_team).name)
          report = Report.last
          visit team_report_path(leader_team, report)
          fill_in "reports-comment-form__comment", with: FactoryBot.build(:report_comment).comment_content
          click_button "reports-coment-form__comment_submit"
          report_comment= ReportComment.last
          visit team_report_path(leader_team, report, report_comment)
          click_on "reports-comment_form__delete"
          page.driver.browser.switch_to.alert.accept
          expect(
            find_by_id(
              "reports-coment-form__comment_title"
            )
          ).to have_content "コメント"
        end
      end

      context 'リーダーが任意のレポート編集画面に遷移したとき' do
        it 'コメントを編集出来る' do
          leader_team = Team.find_by(name: FactoryBot.build(:leader_team).name)
          report = Report.last
          visit team_report_path(leader_team, report)
          fill_in "reports-comment-form__comment", with: FactoryBot.build(:report_comment).comment_content
          click_button "reports-coment-form__comment_submit"
          report_comment= ReportComment.last
          visit team_report_path(leader_team, report, report_comment)
          click_on "reports-comment_form__edit"
          fill_in "reports-comment-form__comment", with: FactoryBot.build(:report_comment).comment_content
          click_button "report_comment_comment_content_submit"
          expect(
            find_by_id(
              "reports-coment-form__comment_title"
            )
          ).to have_content "コメント"
        end
      end
    end
  end
end
