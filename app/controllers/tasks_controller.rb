class TasksController < ApplicationController
  def new
    @lists = List.all
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
  end

  def create
    @lists = List.all
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    if @task.save
      flash[:notice] = "Task successfully added!"
      redirect_to list_path(@task.list)
    else
      render :new
    end
  end

  def edit
    @lists = List.all
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
  end

  def update
    @lists = List.all
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to list_path(@task.list)
    else
      render :edit
    end
  end

  private
    def task_params
      params.require(:task).permit(:description)
    end
end
