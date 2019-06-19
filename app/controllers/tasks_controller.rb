#stark-everglades-56992 --> Heroku apps

class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = 'タスクを投稿しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'タスクの投稿に失敗しました。'
      render :new
    end
      
  end

  def edit
  end

  def update
      
    if @task.update(task_params)
      flash[:success] = 'タスクを編集しました。'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクの編集に失敗しました。'
      render :edit
    end
  end

  def destroy
      
    @task.destroy
    flash[:success] = 'タスクを消去しました。'
    redirect_to root_url
  end
  
  private
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  def set_task
    @task = Task.find(params[:id])
  end
end
