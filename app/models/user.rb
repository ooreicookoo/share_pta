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
end
