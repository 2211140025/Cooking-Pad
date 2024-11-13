class UsersController < ApplicationController
  def index
    @users=User.all
  end
  
  def new
    @user=User.new
  end
  
  def create
    u = User.new(uid: params[:user][:user_id], password: params[:user][:user_pass])
    u.save
    redirect_to users_path
  end
  
  def destoy
    User.find(params[:user_id]).destroy
    redirect_to users_path
  end
end
