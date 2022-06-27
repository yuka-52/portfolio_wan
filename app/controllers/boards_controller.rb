class BoardsController < ApplicationController
  def create
    @board = current_user.boards.new(board_params)
    if @board.save
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
