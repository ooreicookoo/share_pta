class ReportComment < ApplicationRecord
  belongs_to :reports
  validates :comment_content, presence: true
end
