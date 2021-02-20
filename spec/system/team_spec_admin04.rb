require 'rails_helper'
RSpec.describe 'チーム管理機能', type: :system do
  before do
    FactoryBot.create(:admin_user)
    FactoryBot.create(:team)
  end
  describe '新規作成機能' do
    context 'アドミンが作成したチームと全てのチーム一覧が表示される' do
      before do
        visit new_user_session_path
        fill_in "メールアドレス", with: 'admin@gmail.com'
        fill_in "パスワード", with: 'password'
        click_button "ログイン"
      end
      it '作成したタスクが表示される' do
        visit new_team_path
        fill_in "task_title", with: 'task'
        fill_in "task_content", with: 'content'
        click_button "登録"
        expect(page).to have_content 'task'
      end
    end
  end
  describe '新規作成機能' do
    context 'チームを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in "task_title", with: 'task'
        fill_in "task_content", with: 'content'
        click_button "登録"
        expect(page).to have_content 'task'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        task = FactoryBot.create(:task, title: 'task', content: 'content')
        visit tasks_path
        expect(page).to have_content 'task'
      end
    end
    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
        task_list = all('.task_row')
        expect(task_list[1]).to have_content 'Factory'
      end
    end
  end
  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
         task = FactoryBot.create(:task, title: 'task')
         visit task_path(task.id)
         expect(page).to have_content 'task'
       end
     end
  end
end
