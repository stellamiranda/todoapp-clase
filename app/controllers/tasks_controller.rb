class TasksController < ApplicationController
  def index
    @tasks = Task.all 
  end

  # GET with blank form 
  def new
    @task = Task.new
  end

  #POST to save task in DB
  def create
    @task = Task.new(task_params)
    if @task.save
      # TODO: Add flash message with success 
      redirect_to tasks_path
    else
      # TODO: Add flash message with errors 
      render :new 
    end
  end

  private 

  def task_params
    params.require(:task).permit(:title, :description)
  end
end
