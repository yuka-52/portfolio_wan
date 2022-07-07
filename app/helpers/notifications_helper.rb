module NotificationsHelper
  def notification_form(notification)
    @visitor = notification.visitor
    @comment = nil
    your_search = link_to 'あなたの投稿', searches_path(notification), style:"font-weight: bold;"
    @visitor_comment = notification.comment_id
    case notification.action
      when "comment" then
        @comment = Comment.find_by(id: @visitor_comment)&.comment_content
        tag.a(@visitor.name, style:"font-weight: bold;",style:"color: black;")+"が"+tag.a('あなたの投稿', href:search_path(notification.search_id), style:"font-weight: bold;",style:"color: #808080;")+"にコメントしました"
    end
  end

  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end
end
