class ReportComment < ApplicationRecord
  validates :time, presence: true
  t.string :comment_title, null: false
  t.string :comment_content
  belongs_to :user
  belongs_to :reports
end
