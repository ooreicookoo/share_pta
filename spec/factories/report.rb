FactoryBot.define do
  factory :report do
    title { 'test_report_title' }
    content { 'test_report_content' }
    time { '2.5' }
    date { '2020-09-14 00:00:00' }
    place { 'test_report_place' }
    user_id { FactoryBot.create(:user).id }
    team_id { FactoryBot.create(:team).id }
  end
end
