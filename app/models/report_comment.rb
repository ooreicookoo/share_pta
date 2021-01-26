class ReportComment < ApplicationRecord
  validates :comment_title, null: false
  belongs_to :user
  belongs_to :reports
end
