class TaskusersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  def index
    @taskusers = Taskuser.order(id: :desc).page(params[:page]).per(10)
  end

  def show
    @taskuser = Taskuser.find(params[:id])
  end

  def new
    @taskuser = Taskuser.new
  end

  def create
    @taskuser = Taskuser.new(user_params)

    if @taskuser.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @taskuser
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  private
  def user_params
    params.require(:taskuser).permit(:name, :email, :password, :password_confirmation)
  end

end
