class HomeController < ApplicationController
  def index
    @tasks = Task.pending
    @backlog_tasks = Task.in_backlog
    @task = Task.new
    @backlog_task = Task.new
    @events = Event.not_done
    @event = Event.new
  end
end
