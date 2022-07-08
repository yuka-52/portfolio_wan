class BoardsController < ApplicationController
  def create
    @sight = Sight.find(params[:sight_id])
    @board = @sight.boards.build(board_params)
    @board.user_id = current_user.id
    @board_sight = @board.sight
    if @board.save
      @board_sight.create_notification_board!(current_user, @board.id)
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

    def board_params
      params.require(:board).permit(:board_content, :sight_id)
    end
  end
