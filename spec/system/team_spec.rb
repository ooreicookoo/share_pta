require 'rails_helper'
RSpec.describe 'チーム作成機能', type: :system do
  before do
    FactoryBot.create(:team)
    FactoryBot.create(:second_team)
    FactoryBot.create(:third_team)
  end
  describe '新規作成機能' do
    context 'チームを新規作成した場合' do
      it '作成したチームが表示される' do
        visit new_team_path
        fill_in "Factoryで作ったテストネーム", with: 'team'
        fill_in "Factoryで作ったテストネーム2", with: 'team'
        fill_in "Factoryで作ったテストネーム3", with: 'team'
        click_button "Create Task"
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



RSpec.describe 'タスク管理機能', type: :system do
  before do
    # あらかじめタスク一覧のテストで使用するためのタスクを二つ作成する
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
  end
# 省略
end
