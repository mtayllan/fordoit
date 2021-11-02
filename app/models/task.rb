class Task < ApplicationRecord
  belongs_to :user

  enum status: [:pending, :completed, :cancelled, :in_backlog]

  validates :title, presence: true
end
