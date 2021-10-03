class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.save

    respond_to do |format|
      format.html { redirect_to tasks_path }
      format.turbo_stream { render turbo_stream: turbo_stream.replace(:task_form, partial: "tasks/form", locals: {task: Task.new}) }
    end
  end

  def update
    task = Task.find(params[:id])
    task.update(status: params[:status])

    respond_to do |format|
      format.html { redirect_to tasks_path }
      format.turbo_stream {}
    end
  end

  private

  def task_params
    params.require(:task).permit(:title)
  end
end
