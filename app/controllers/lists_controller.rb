class ListsController < ApplicationController
  def index
    @lists = List.all
end

def show
  @lists = List.find(params[:id])
end

def new
  @lists = List.new
end

def create
  @list = List.create(list_params)

  if @list.save
    redirect_to list_path(@list), notice: "list was successfully created"
  else
    render :new
  end
end

def destroy
  @lists = List.find(params[:id])
  @lists.destroy
  redirect_to lists_path, status: :see_other

end

private

def list_params
  params.require(:list).permit(:name)
end
end
