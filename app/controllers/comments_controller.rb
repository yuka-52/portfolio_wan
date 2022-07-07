class CommentsController < ApplicationController
  def create
      @search = Search.find(params[:search_id])
      @comment = @search.comments.build(comment_params)
      @comment.user_id = current_user.id
      @comment_search = @comment.search
      if @comment.save
        @comment_search.create_notification_comment!(current_user, @comment.id)
        redirect_back(fallback_location: root_path)
      else
        redirect_back(fallback_location: root_path)
      end
    end

  private

  def comment_params
    params.require(:comment).permit(:comment_content, :search_id)
  end
end
