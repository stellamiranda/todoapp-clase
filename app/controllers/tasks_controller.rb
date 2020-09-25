class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  # before_action :set_task, except: [:index, :new]
  before_action :authenticate_user!

  def index
    # show all tasks
    # @tasks = Task.all

    #show only tasks that belongs to the user logged in
    @tasks = current_user.tasks

    # Option 2 show only tasks that belongs to the user logged in
    # @tasks = Task.where(user_id: current_user.id)
  end

  # GET with blank form 
  def new
    @task = Task.new
  end

  def show
  end

  def edit
  end

  #POST to save task in DB
  def create
    # @task = Task.new(task_params)
    # @task.user_id = current_user.id

    @task = current_user.tasks.new(task_params)
    
    if @task.save
      # TODO: Add flash message with success 
      redirect_to tasks_path
    else
      # TODO: Add flash message with errors 
      render :new 
    end
  end

  #POST to save task in DB
  def update

    if @task.update(task_params)
      # TODO: Add flash message with success
      redirect_to tasks_path
    else
      # TODO: Add flash message with errors
      render :new
    end
  end

  def destroy 
    @task.destroy
    redirect_to tasks_path
  end

  private 

  def task_params
    params.require(:task).permit(:title, :description)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
