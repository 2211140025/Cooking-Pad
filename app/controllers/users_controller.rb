class UsersController < ApplicationController
  def index
    @users=User.all
  end
  
  def new
    @user=User.new
  end
  
  def create
    u = User.new(user_id: params[:user][:user_id], user_pass: params[:user][:user_pass])
    u.save
    redirect_to users_path
  end
  
  def destroy
    User.find(params[:user_id]).destroy
    redirect_to users_path
  end
  
  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes
  end
end

