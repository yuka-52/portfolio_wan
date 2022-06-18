class SightsController < ApplicationController
  # before_action :authenticate_user!
  before_action :ensure_user, only: [:edit, :update, :destroy]

  def index
    @sights = Sight.all
  end

  def new
    @sight = Sight.new
  end

  def create
    @sight = Sight.new(sight_params)
    @sight.user_id = current_user.id
    if @sight.save
      flash[:notice] = "目撃した犬を登録しました"
      redirect_to :sights
    else
      flash[:notice] = "全ての項目を入力してください"
      render "new"
    end
  end

  def show
    @sight = Sight.find(params[:id])
  end

  def edit
    @sight = Sight.find(params[:id])
  end

  def update
    @sight = Sight.find(params[:id])
    if @sight.update(sight_params)
      flash[:notice] = "目撃した犬の情報を更新しました"
      redirect_to :sights
    else
      render "edit"
    end
  end

  def destroy
    @sight = Sight.find(params[:id])
    @sight.destroy
    flash[:notice] = "目撃した犬の情報を削除しました"
    redirect_to :sights
  end

  def search
    @sights = Sight.search(params[:search], params[:address])
  end

  private

  def sight_params
    params.require(:sight).permit(:sight_title, :sight_profile, :sight_place,
    :sight_date, :sight_contact, { sight_images: [] })
  end

  def ensure_user
    @sights = current_user.sights
    @sight = @sights.find_by(id: params[:id])
  end
end
