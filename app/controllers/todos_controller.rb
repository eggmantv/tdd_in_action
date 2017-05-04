class TodosController < ApplicationController

  before_action :auth_user

  def index
    @todos = current_user.todos.order("id desc")
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = current_user.todos.new(params.require(:todo).permit(:title))
    if @todo.save
      redirect_to todos_path
    else
      render action: :new
    end
  end

end
