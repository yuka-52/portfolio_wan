module NotificationsHelper
  def notification_form(notification)
    @visitor = notification.visitor
    @comment = nil
    @board = nil
    @message = nil
    your_search = link_to 'あなたの投稿', searches_path(notification), style: "font-weight: bold;"
    your_sight = link_to 'あなたの投稿', sights_path(notification), style: "font-weight: bold;"
    your_room = link_to 'あなた', rooms_path(notification), style: "font-weight: bold;"
    @visitor_comment = notification.comment_id
    @visitor_borad = notification.board_id
    @visitor_message = notification.message_id
    case notification.action
    when "comment" then
      @comment = Comment.find_by(id: @visitor_comment)
      tag.a(@visitor.name, style: "font-weight: bold;" "color: black;") + "が" + tag.a('あなたの投稿',
      href: search_path(notification.search_id), style: "font-weight: bold;" "color: #808080;") + "にコメントしました"
    when "board" then
      @board = Board.find_by(id: @visitor_board)
      tag.a(@visitor.name, style: "font-weight: bold;" "color: black;") + "が" + tag.a('あなたの投稿',
      href: sight_path(notification.sight_id), style: "font-weight: bold;" "color: #808080;") + "にコメントしました"
    when "dm" then
      @message = Message.find_by(id: @visitor_message)
      tag.a(@visitor.name, style: "font-weight: bold;" "color: black;") + "が" + tag.a('あなた',
      href: room_path(notification.room_id), style: "font-weight: bold;" "color: #808080;") + "にDMを送りました"
    end
  end

  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end
end
