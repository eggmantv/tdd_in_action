class TodosController < ApplicationController

  def index
    @todos = Todo.order("id desc")
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(params.require(:todo).permit(:title))
    if @todo.save
      redirect_to todos_path
    else
      render action: :new
    end
  end

end
