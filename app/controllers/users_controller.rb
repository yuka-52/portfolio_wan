class UsersController < ApplicationController
  before_action :authenticate_user!, :only => [:show]

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

  def profile
    @user = User.find(params[:id])
    @current_userentry = Entry.where(user_id: current_user.id)
    @user_entry = Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @current_userentry.each do |cu|
        @user_entry.each do |u|
          if cu.room_id == u.room_id
            @is_room = true
            @room_id = cu.room_id
          end
        end
      end
      if @is_room
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
