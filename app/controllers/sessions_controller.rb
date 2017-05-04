class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(username: params[:username], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to todos_path
    else
      flash[:notice] = "用户名密码不正确"
      render action: :new
    end
  end

end
