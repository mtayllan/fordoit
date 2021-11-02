class Event < ApplicationRecord
  belongs_to :user

  validates :title, :datetime, presence: true

  scope :not_done, -> { where(done_at: nil) }
end
