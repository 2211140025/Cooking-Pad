class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
  
    # ユーザーIDの重複チェック
    if User.exists?(user_id: @user.user_id)
      @user.errors.add(:user_id, 'すでにそのIDは使われています')
      render :new, status: :unprocessable_entity and return
    end
  
    if @user.save
      redirect_to login_path, notice: '登録が完了しました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_id, :user_pass)
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
    @recipes = Recipe.where(user_id: params[:id])
  end
end
