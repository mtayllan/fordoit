# frozen_string_literal: true

class TextInputComponent < ViewComponent::Base
  def initialize(name:, form:, placeholder:)
    @name = name
    @form = form
    @placeholder = placeholder
  end
end
