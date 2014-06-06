class SecretNumbersController < ApplicationController
  def new
  end

  def show
    @guess = params[:id].to_i
    @secret_num = rand(5) + 1
  end
end