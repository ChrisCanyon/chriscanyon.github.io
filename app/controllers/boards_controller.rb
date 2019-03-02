class BoardsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:update]

  def show
    @board = Board.find_by(nickname: params[:nickname], id: params[:id])
    @drink_log = Drank.where("created_at >= :date", date: DateTime.now.beginning_of_day)
    @boards = leader_board
  end

  def update
    @board = Board.find_by(id: params[:id])
    beer_index = params[:beer_index].to_i
    to_update = @board.beers[beer_index]
    to_update['drank'] = !to_update['drank']
    @board.distance = distance
    @board.save
    drank = Drank.find_or_create_by(beer: to_update['beer'], drinker: @board.nickname)
    drank.destroy unless to_update['drank']
  end

  def leader_board
    Board.where("created_at >= :date", date: DateTime.now.beginning_of_day).sort {|x,y| y.distance <=> x.distance }
  end

  def distance
    rows = []
    5.times do |x|
      rows << @board.beers[(x*5)..((x+1)*5 - 1)]
    end

    counts = []
    rows.each do |row|
      count = 0
      row.each do |beer|
        count += 1 unless beer['drank']
      end
      counts << count
    end

    5.times do |i|
      count = 0
      5.times do |j|
        count += 1 unless rows[j][i]['drank']
      end
      counts << count
    end

    count = 0
    5.times do |i|
      count += 1 unless rows[i][i]['drank']
    end
    counts << count

    count = 0
    5.times do |i|
      count += 1 unless rows[i][4-i]['drank']
    end
    counts << count

    counts.min
  end
end
