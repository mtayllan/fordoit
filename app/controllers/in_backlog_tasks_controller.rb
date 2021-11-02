class InBacklogTasksController < AuthenticatedController
  def create
    task = Task.new(task_params)
    task.status = :in_backlog
    task.user = current_user
    task.save

    render turbo_stream: [
      turbo_stream.replace(
        :in_backlog_task_form,
        partial: "tasks/in_backlog_form",
        locals: {task: Task.new}
      ),
      turbo_stream.append(:in_backlog_tasks, partial: "tasks/task", locals: {task: task})
    ]
  end

  def update
    task = current_user.tasks.find(params[:id])
    task.update(status: :pending)

    render turbo_stream: [
      turbo_stream.remove(dom_id(task)),
      turbo_stream.append(:tasks, partial: "tasks/task", locals: {task: task})
    ]
  end

  def destroy
    task = current_user.tasks.find(params[:id])
    task.destroy

    render turbo_stream: turbo_stream.remove(dom_id(task))
  end

  private

  def task_params
    params.require(:task).permit(:title)
  end
end
