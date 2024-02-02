require "open-uri"
require "json"

class GamesController < ApplicationController

  def new
    @letters = (0...10).map { ('A'..'Z').to_a[rand(26)] }
  end

  def score
    @array = params[:letters].split('')
    @answer = params[:score].upcase
    @answer_array = @answer.split('')
    @real_word = api_call?(@answer)
  end

  private

  def api_call?(answer)

    api_response = URI.open("https://wagon-dictionary.herokuapp.com/#{answer}")

    json = JSON.parse(api_response.read)

    json['found']
  end
end
