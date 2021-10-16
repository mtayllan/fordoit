class TasksController < ApplicationController
  def create
    task = Task.new(task_params)
    task.save

    render turbo_stream: [
      turbo_stream.replace(:task_form, partial: "tasks/form", locals: {task: Task.new}),
      turbo_stream.append(:tasks, partial: "tasks/task", locals: {task: task})
    ]
  end

  def update
    task = Task.find(params[:id])
    task.update(status: params[:status])

    render turbo_stream: turbo_stream.replace(
      dom_id(task),
      partial: "tasks/task",
      locals: {task: task}
    )
  end

  private

  def task_params
    params.require(:task).permit(:title)
  end
end
