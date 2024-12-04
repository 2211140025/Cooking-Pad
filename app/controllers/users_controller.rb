class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
<<<<<<< HEAD
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, notice: '登録が完了しました。'
    else
      render :new, status: :unprocessable_entity
    end
=======
    u = User.new(user_id: params[:user][:user_id], user_pass: params[:user][:user_pass])
    u.save
    redirect_to root_path
>>>>>>> 0caba34028466072009fe69fcfd3f45c767a0a40
  end

  private

  def user_params
    params.require(:user).permit(:user_id, :user_pass)
  end

  def destroy
    User.find(params[:user_id]).destroy
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
<<<<<<< HEAD
    # @recipes = @user.recipes
=======
    @recipes = Recipe.where(user_id: params[:id])
>>>>>>> 0caba34028466072009fe69fcfd3f45c767a0a40
  end
end
