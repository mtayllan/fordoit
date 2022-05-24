class HomeController < AuthenticatedController
  def index
    @tasks = current_user.tasks.pending_or_ended_today
    @backlog_tasks = current_user.tasks.in_backlog
    @events = current_user.events.not_done.order(datetime: :asc)
    @today_repeats = current_user.repeats.where("days @> ARRAY[?]::integer[]", [Date.today.wday])
    @other_repeats = @today_repeats.invert_where

    @task = Task.new
    @backlog_task = Task.new
    @event = Event.new
    @repeat = Repeat.new
  end
end
