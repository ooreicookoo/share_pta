class Team < ApplicationRecord
end

class Team < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  has_many :users
  has_many :assigns, dependent: :destroy
  has_many :reports, dependent: :destroy

  # def invite_member(user)
  #   assigns.create(user: user)
  # end
end
