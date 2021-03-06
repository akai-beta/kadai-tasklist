class TasksController < ApplicationController
  
before_action :require_user_logged_in
before_action :correct_user, only: [:destroy, :show, :edit, :update]

  def index
  end
  
  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
    #binding.pry
  end
  
  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = 'Taskが正常にセットされました'
      redirect_to root_url
    else
      flash.now[:danger] = 'taskがセットされませんでした'
      render :new
    end
    
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = 'Taskが正常に更新されました'
      redirect_to root_url
    else
      flash.now[:danger] = 'taskが更新されませんでした'
      render :new
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = 'タスクが削除されました'
    redirect_to root_url
  end
  
  private
  
  # Strong Parameter
  def task_params
    params.require(:task).permit('content', 'status', 'user_id')
  end
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
      unless @task
        redirect_to root_url
      end
  end
  
end
