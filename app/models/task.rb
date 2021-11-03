class Task < ApplicationRecord
  belongs_to :user

  enum status: [:pending, :completed, :cancelled, :in_backlog]

  validates :title, presence: true

  scope :ended_today, -> { where(ended_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day) }
  scope :pending_or_ended_today, -> { pending.or(ended_today) }
end
