class LeaderBoardController < ApplicationController
  def index
    @boards = leader_board
    render partial: 'leader_board'
  end

  def leader_board
    Board.all.sort {|x,y| y.distance <=> x.distance }
  end
end
