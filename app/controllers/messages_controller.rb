class MessagesController < ApplicationController
  before_action :authenticate_user!, :only => [:create]

  def create
    if Entry.where(:user_id => current_user.id, :room_id => params[:message][:room_id]).present?
      @message = Message.create(params.require(:message).permit(:user_id, :content, :room_id).merge(:user_id => current_user.id))
      @message.user_id = current_user.id
      @room_message = @message.room
      if @message.save
        @room_message.create_notification_dm!(current_user, @message.id)
        redirect_back(fallback_location: root_path)
      end
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
