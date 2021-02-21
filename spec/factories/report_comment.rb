FactoryBot.define do
  factory :report_comment do
    report_comment { 'test_comment' }
    report_id { FactoryBot.create(:report).id }
  end
end
