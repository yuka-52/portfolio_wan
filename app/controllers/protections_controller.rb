class ProtectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_user, only: [:edit, :update, :destroy]

  def index
    @protections = Protection.all
  end

  def new
    @protection = Protection.new
  end
    
  def create
    @protection = Protection.new(protection_params)
    @protection.user_id = current_user.id
    if @protection.save
      flash[:notice] = "保護犬を登録しました"
      redirect_to  :protections
    else
      flash[:notice] = "全ての項目を入力してください"
      render "new"
    end
  end
       
  def show
    @protection = Protection.find(params[:id])
  end
       
  def edit
    @protection = Protection.find(params[:id])
  end

  def update
    @protection = Protection.find(params[:id])
    if @protection.update(protection_params)
      flash[:notice] = "保護犬情報を更新しました"
      redirect_to :protections
    else
      render "edit"
    end
  end

  def destroy
    @protection = Protection.find(params[:id])
    @protection.destroy
    flash[:notice] = "保護犬情報を削除しました"
    redirect_to :protections
  end
    
  private

  def protection_params
      params.require(:protection).permit(:protection_title, :protection_breed, :protection_profile,
      :protection_place, :protection_date, :protection_contact, :protection_choker, :protection_dogtag,
      :contacted_institution, { protection_images: [] })
  end

  def ensure_user
    @protections = current_user.protections
    @protection = @protections.find_by(id: params[:id])
  end
end
