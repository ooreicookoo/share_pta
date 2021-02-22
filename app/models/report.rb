class Report < ApplicationRecord
  belongs_to :user
  belongs_to :team
  has_many :report_comments, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :time, presence: true
  validates :content, presence: true
  validates :date, presence: true
  validates :content, length: { maximum: 1000 }

  def self.graphy(reports: [])
    reports = reports || Report.all
    users = reports
      .map(&:user)
      .uniq(&:id)
    users.map { |user| [user.name, user.sum_report_time] }
  end
end
