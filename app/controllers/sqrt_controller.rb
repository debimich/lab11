# frozen_string_literal: true

# SqrtController
class SqrtController < ApplicationController
  before_action :input, only: [:view]

  def input; end

  def db_out
    respond_to do |format|
      format.xml { render xml: SqrtDb.all.as_json }
    end
  end

  def view
    redirect_to action: :input if valid(params[:v]) == false
    create
    render :view
  end

  def valid(val)
    @a = val.to_i
    return false if @a <= 0

    true
  end

  def create
    temp = SqrtDb.find_by(input: @a)
    if temp.nil?
      calc
      json = { arr: @guesses }
      SqrtDb.create(input: @a, result: json)
    else
      @guesses = temp[:result]['arr']
    end
  end

  def calc
    epsilon = 0.001
    @guesses = [@a]
    loop do
      next_guess = 0.5 * (@guesses.last + @a / @guesses.last)
      @guesses << next_guess
      break if (next_guess * next_guess - @a) / @a < epsilon
    end
    @guesses.shift
  end
end
