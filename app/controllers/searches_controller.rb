class SearchesController < ApplicationController
  # before_action :authenticate_user!
  before_action :ensure_user, only: [:edit, :update, :destroy]

  def index
    @searches = Search.all
  end

  def new
    @search = Search.new
  end

  def create
    @search = Search.new(search_params)
    @search.user_id = current_user.id
    if @search.save
      flash[:notice] = "迷子犬を登録しました"
      redirect_to :searches
    else
      flash[:notice] = "全ての項目を入力してください"
      render "new"
    end
  end

  def show
    @search = Search.find(params[:id])
  end

  def edit
    @search = Search.find(params[:id])
  end

  def update
    @search = Search.find(params[:id])
    if @search.update(search_params)
      flash[:notice] = "迷子犬情報を更新しました"
      redirect_to :searches
    else
      render "edit"
    end
  end

  def destroy
    @search = Search.find(params[:id])
    @search.destroy
    flash[:notice] = "迷子犬情報を削除しました"
    redirect_to :searches
  end

  private

  def search_params
    params.require(:search).permit(:search_title, :dog_breed,
    :dog_age, :dog_profile, :disappeared_place, :disappeared_date,
    :contact, { dog_images: [] })
  end

  def ensure_user
    @searches = current_user.searches
    @search = @searches.find_by(id: params[:id])
  end
end
