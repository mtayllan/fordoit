class Event < ApplicationRecord
  validates :title, :datetime, presence: true

  scope :not_done, -> { where(done_at: nil) }
end
