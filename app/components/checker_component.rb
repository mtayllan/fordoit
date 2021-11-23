# frozen_string_literal: true

class CheckerComponent < ViewComponent::Base
  def initialize(action:)
    @action = action
  end
end
