class SqrtController < ApplicationController

  before_action :input, only: [:view]
  before_action :valid, only: [:view]

  def input
  end

  

  def view
    valid
    create
    @side = params[:side]
    if @side == 'count'
      render :view
    elsif @side == 'DB'

    end
  end

  def valid
    @a = params[:v].to_i
    if !(@a > 0)
      redirect_to action: :input
    end
  end

  def create
    temp = SqrtDb.find_by(input: @a)
    if temp.nil?
      epsilon = 0.001
      @guesses = [@a]
      loop do
        next_guess = 0.5 * (@guesses.last + @a / @guesses.last)
        @guesses << next_guess
        break if (next_guess * next_guess - @a) / @a < epsilon
      end
      @guesses.shift
      json = {arr: @guesses}
      SqrtDb.create(input: @a, result: json)
    else
      @guesses = temp[:result]["arr"]
    end
  end
end
