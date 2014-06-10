class RockPaperScissorsController < ApplicationController
  def new
  end

  def show
    @guess = params[:id].to_i
    @other_player = rand(3) + 1
  end
end
