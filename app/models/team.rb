class Team < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  has_many :users, through: :assigns
  has_many :assigns, dependent: :destroy
  has_many :reports, dependent: :destroy

  with_options on: :invite? do
    validates :name,  presence: true
  end
end
