class TasksController < ApplicationController
  def index
    @lists = List.all
    @complete_tasks = Task.done
    @incomplete_tasks = Task.not_done
  end

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
      params.require(:task).permit(:description, :list_id, :done)
    end
end
