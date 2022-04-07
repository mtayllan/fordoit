# frozen_string_literal: true

class EventItemComponent < ViewComponent::Base
  def initialize(event:)
    @event = event
  end

  def datetime_color
    if @event.datetime < Time.zone.now
      "text-red-600"
    elsif @event.datetime < 24.hours.from_now
      "text-yellow-600"
    else
      ""
    end
  end
end
