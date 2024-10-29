class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  def create
    u = User.new(uid: params[:user][:uid], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
  
  if u.save
    redirect_to users_path, notice: "User successfully created"
  else
    render :new, alert: "Failed to create user"
  end
  end

  
  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path
  end
end
