class Team < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  has_many :assigns, dependent: :destroy
  has_many :members, through: :assigns, source: :user
  has_many :reports, dependent: :destroy


  def assign_reports
    Report.where(id:
      self.reports
        .select { |report| self.assigns.find_by(user_id: report.user_id).present? || report.user.admin  }
        .map(&:id)
    )
  end

end
