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
        click_button "Create Team"
        expect(page).to have_content 'Team'
      end
    end
  end
  describe 'チーム一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのチーム一覧が表示される' do
        team = FactoryBot.create(:team, name: 'Factoryで作ったテストネーム')
        visit teams_path
        expect(page).to have_content 'team'
      end
    end
  end

  describe 'チーム詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
         team = FactoryBot.create(:team, name: 'team')
         visit team_path(team.id)
         expect(page).to have_content 'team'
       end
     end
  end
end
