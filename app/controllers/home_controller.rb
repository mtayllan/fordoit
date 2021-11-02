class HomeController < AuthenticatedController
  def index
    @tasks = Task.pending
    @backlog_tasks = Task.in_backlog
    @events = Event.not_done
    @repeats = Repeat.where("days @> ARRAY[?]::integer[]", [Date.today.wday])

    @task = Task.new
    @backlog_task = Task.new
    @event = Event.new
    @repeat = Repeat.new
  end
end
