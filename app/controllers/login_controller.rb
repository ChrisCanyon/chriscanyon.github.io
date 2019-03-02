class LoginController < ApplicationController
  def create
    board = Board.find_or_create_by(nickname: params[:board][:nickname])
    if board.created_at < DateTime.new.beginning_of_day
      board.delete
      board = Board.create(nickname: params[:board][:nickname])
    end
    redirect_to boards_path(id: board.id, nickname: board.nickname)
  end

  def new
    @board = Board.new
    @drink_log = Drank.where("created_at >= :date", date: DateTime.now.beginning_of_day)
    @boards = leader_board
  end

  def leader_board
    Board.where("created_at >= :date", date: DateTime.now.beginning_of_day).sort {|x,y| y.distance <=> x.distance }
  end
end
