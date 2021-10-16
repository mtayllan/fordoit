class HomeController < ApplicationController
  def index
    @tasks = Task.pending.all
    @task = Task.new
  end
end
