class BoardsController < ApplicationController
  def create
    @board = current_user.boards.build(board_params)
    @board.sight_id = params[:sight_id]
    if @board.save
      @sight = @board.sight
      @sight.create_notification_board!(current_user, @board.id)
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
