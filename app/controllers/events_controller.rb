class EventsController < AuthenticatedController
  def create
    event = Event.new(event_params)
    event.user = current_user
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
    event = current_user.events.find(params[:id])
    event.update(done_at: Time.zone.now)

    render turbo_stream: turbo_stream.remove(dom_id(event))
  end

  def destroy
    event = current_user.events.find(params[:id])
    event.destroy

    render turbo_stream: turbo_stream.remove(dom_id(event))
  end

  private

  def event_params
    params.require(:event).permit(:title, :datetime)
  end
end
