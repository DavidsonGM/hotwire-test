class UserTasksController < ApplicationController
  def index
    @user_tasks = UserTask.all
  end

  def create
    p params
    @todo = UserTask.create!(name: params[:name])

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.append("todos", partial: "user_tasks/partials/todo", locals: {task: @todo})
      end
    end
  rescue StandardError => e
    puts e
  end

  def destroy
    todo = UserTask.find(params[:id])

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.remove("todo_#{todo.id}")
      end
    end
  end
end
