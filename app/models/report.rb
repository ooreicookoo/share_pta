class Report < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1, maximum: 100 }
  validates :time, presence: true
  validates :date, presence: true
  validates :content, length: { maximum: 1000 }
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :team
  has_many :report_comments, dependent: :destroy

  def self.graphy(reports: [])
    reports = reports || Report.all
    users = reports
      .map(&:user)
      .uniq(&:id)
    users.map { |user| [user.name, user.sum_report_time] }
  end
end
