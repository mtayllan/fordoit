class User < ApplicationRecord
  validates :auth0_id, presence: true, uniqueness: true
end
