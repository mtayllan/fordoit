class HomeController < AuthenticatedController
  def index
    @tasks = current_user.tasks.pending
    @backlog_tasks = current_user.tasks.in_backlog
    @events = current_user.events.not_done.order(datetime: :asc)
    @repeats = current_user.repeats.where("days @> ARRAY[?]::integer[]", [Date.today.wday])

    @task = Task.new
    @backlog_task = Task.new
    @event = Event.new
    @repeat = Repeat.new
  end
end
