class KaigyoController < ApplicationController
  def index
    return if wrong_params?
    @processed_text = Word.new(params[:data]).format
  end

  private

  def wrong_params?
    params[:data].blank? ||
      params[:data][:num].blank? ||
      params[:data][:num].to_i < 1
  end
end
