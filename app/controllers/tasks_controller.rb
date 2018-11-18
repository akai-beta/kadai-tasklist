class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  
  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = 'Taskが正常にセットされました'
      redirect_to @task
    else
      flash[:danger] = 'taskがセットされませんでした'
      render new
    end
    
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = 'Taskが正常にセットされました'
      redirect_to @task
    else
      flash[:danger] = 'taskがセットされませんでした'
      render new
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = 'タスクが削除されました'
    redirect_to tasks_url
  end
  
  private
  
  # Strong Parameter
  def task_params
    params.require(:task).permit('content')
  end
  
end
