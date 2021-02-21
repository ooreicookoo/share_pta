FactoryBot.define do
  factory :report_comment do
    comment_content { 'test_comment' }
    report_id { FactoryBot.create(:report).id }
  end
end
