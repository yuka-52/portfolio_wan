class MessagesController < ApplicationController
  before_action :authenticate_user!, :only => [:create]

  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    @message_room = @message.room
    if @message.save
      @message_room.create_notification_dm!(current_user, @message.id)
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def message_params
    params.require(:message).permit(:room_id, :content)
  end
end
