class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    
    # ユーザーがログインしているか確認
    unless current_user
      redirect_to login_path, alert: 'ログインしてください'
      return
    end
  
    # ユーザーを関連付ける
    @recipe.user = current_user
  
    # レシピを保存
    if @recipe.save
      redirect_to @recipe, notice: 'レシピが追加されました。'
    else
      render :new
    end
  end

  def edit
    @recipe=Recipe.find(params[:id])
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'レシピが更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: 'レシピが削除されました。'
  end

  def search
    @recipes = Recipe.where("title LIKE ? OR content LIKE ?", "%#{params[:word]}%", "%#{params[:word]}%")
  end
  
  def category_serch
    @recipes = Recipe.where("category LiKE ?", "%#{params[:category]}%")
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(
        :title, :serving_size, :content, :tips, :image, :category_id,
        ingredients_attributes: [:id, :name, :quantity, :_destroy],
        steps_attributes: [:id, :description, :image, :_destroy]
      )
    end
end
