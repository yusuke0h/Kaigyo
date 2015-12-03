class KaigyoController < ApplicationController
  def index
    data = params[:data]
    return unless data
    num = data[:num].to_i == 0 ? 30 : data[:num].to_i

    formatted_text =
      data[:text]
      .strip
      .gsub("\r", '')
      .split("\n")

    lines = []

    formatted_text.each do |line|
      line
        .scan(/.{1,#{num}}/)
        .map { |chopped_line| lines << chopped_line }
    end
    @processed_text = lines.join('<br>')
  end
end
