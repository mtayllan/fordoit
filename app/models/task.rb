class Task < ApplicationRecord
  enum status: [:pending, :completed, :cancelled, :in_backlog]

  validates :title, presence: true
end
