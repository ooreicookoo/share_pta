class Team < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  has_many :users, through: :assigns
  has_many :assigns, dependent: :destroy
  has_many :reports, dependent: :destroy
end
