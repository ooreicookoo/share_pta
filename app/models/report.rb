class Report < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1, maximum: 100 }
  validates :time, presence: true
  validates :date, presence: true
  validates :content, length: { maximum: 1000 }
  mount_uploader :image, ImageUploader
  # belongs_to :user
  has_many :report_comments
end
