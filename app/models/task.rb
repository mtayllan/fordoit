class Task < ApplicationRecord
  enum status: [:pending, :completed, :cancelled]

  validates :title, presence: true

  after_create_commit { broadcast_append_to :tasks }
  after_update_commit { broadcast_replace_to :tasks }
end
