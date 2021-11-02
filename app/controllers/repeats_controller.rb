class RepeatsController < AuthenticatedController
  def create
    repeat = Repeat.new(repeat_params)
    repeat.user = current_user
    repeat.save

    render turbo_stream: [
      turbo_stream.replace(
        :repeat_form,
        partial: "repeats/form",
        locals: {repeat: Repeat.new}
      ),
      turbo_stream.append(:repeats, partial: "repeats/repeat", locals: {repeat: repeat})
    ]
  end

  def update
    repeat = current_user.repeats.find(params[:id])
    if params[:hit] == "done"
      repeat.update(hits: repeat.hits + [Date.today])
    elsif params[:hit] == "undo"
      repeat.update(hits: repeat.hits - [Date.today])
    end

    render turbo_stream: turbo_stream.replace(
      dom_id(repeat),
      partial: "repeats/repeat",
      locals: {repeat: repeat}
    )
  end

  def destroy
    repeat = current_user.repeats.find(params[:id])
    repeat.destroy

    render turbo_stream: turbo_stream.remove(dom_id(repeat))
  end

  private

  def repeat_params
    params.require(:repeat).permit(:title, days: [])
  end
end
