class HomeController < AuthenticatedController
  def index
    @tasks = current_user.tasks.pending_or_ended_today
    @backlog_tasks = current_user.tasks.in_backlog
    @events = current_user.events.not_done.order(datetime: :asc)
    @today_repeats = current_user.repeats.where("days @> ARRAY[?]::integer[]", [Time.zone.today.wday])
    @other_repeats = current_user.repeats.where.not("days @> ARRAY[?]::integer[]", [Time.zone.today.wday])

    @task = Task.new
    @backlog_task = Task.new
    @event = Event.new
    @repeat = Repeat.new
  end
end
