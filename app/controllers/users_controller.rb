class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    u = User.new(user_id: params[:user][:user_id], user_pass: params[:user][:user_pass])
  
    # ユーザーIDの重複チェック
    if User.exists?(user_id: u.user_id)
      u.errors.add(:user_id, 'すでにそのIDは使われています')
      render :new, status: :unprocessable_entity and return
    end
  
    if u.save
      redirect_to root_path, notice: '登録が完了しました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private



  def destroy
    User.find(params[:id]).destroy
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
    @recipes = Recipe.where(user_id: params[:id])
  end
end
