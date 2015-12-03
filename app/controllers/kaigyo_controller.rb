class KaigyoController < ApplicationController
  def index
    return if params[:data][:num].to_i < 1
    @processed_text = Word.new(params[:data]).format
  end
end
