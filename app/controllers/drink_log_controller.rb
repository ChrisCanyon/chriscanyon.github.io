class DrinkLogController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:index]

  def index
    @drink_log = Drank.all
    render partial: 'drink_log'
  end
end
