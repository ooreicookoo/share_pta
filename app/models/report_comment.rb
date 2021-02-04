class ReportComment < ApplicationRecord
  belongs_to :report
  validates :comment_content, presence: true
end
