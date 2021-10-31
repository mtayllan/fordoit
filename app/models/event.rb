class Event < ApplicationRecord
  validates :title, :datetime, presence: true
end
