class EventsController < ApplicationController
  def create
    event = Event.new(event_params)
    event.save

    render turbo_stream: [
      turbo_stream.replace(
        :event_form,
        partial: "events/form",
        locals: {event: Event.new}
      ),
      turbo_stream.append(:events, partial: "events/event", locals: {event: event})
    ]
  end

  def update
    event = Event.find(params[:id])
    event.update(done_at: Time.zone.now)

    render turbo_stream: turbo_stream.remove(dom_id(event))
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy

    render turbo_stream: turbo_stream.remove(dom_id(event))
  end

  private

  def event_params
    params.require(:event).permit(:title, :datetime)
  end
end
