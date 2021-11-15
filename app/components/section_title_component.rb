# frozen_string_literal: true

class SectionTitleComponent < ViewComponent::Base
  def initialize(title:)
    @title = title
  end
end
