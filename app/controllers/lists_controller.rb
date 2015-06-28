class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @lists = List.all
    @list = List.find(params[:id])
  end

  def create
    @lists = List.all
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def new
    @lists = List.all
    @list = List.new
  end

  def edit
    @lists = List.all
    @list = List.find(params[:id])
  end

  def update
    @lists = List.all
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to list_path(@list)
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  private
    def list_params
      params.require(:list).permit(:name, :description)
    end
end
