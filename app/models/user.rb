class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # validates :name, presence: true, uniqueness: true
  has_many :reports, dependent: :destroy
  has_many :report_comments, dependent: :destroy
  has_many :assigns, dependent: :destroy
  has_many :teams, foreign_key: :owner_id
  has_many :teams, through: :assigns
  has_many :report_comments, dependent: :destroy

  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true
  before_validation { email.downcase! }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :school_year, presence: true
  validates :school_class, presence: true

  def sum_report_time
    self.reports.sum(:time)
  end

end
