class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if current_user == @user
      if @user.update params.require(:user).permit(:name)
        flash[:notice] = "更新しました"
        redirect_to "/users/account"
      else
        flash[:notice] = "更新できませんでした"
        render "users/account"
      end
    else
      redirect_to "/"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :introdction, :image)
  end
end
