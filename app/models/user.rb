class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :repeats, dependent: :destroy

  validates :auth0_id, presence: true, uniqueness: true
end
