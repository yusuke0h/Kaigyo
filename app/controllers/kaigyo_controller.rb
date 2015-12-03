class KaigyoController < ApplicationController
  def index
    data = params[:data]
    return unless data
    num = data[:num].to_i == 0 ? 30 : data[:num].to_i

    lines = []

    formatted_text =
      data[:text]
      .strip
      .gsub("\r", '')
      .split("\n")

    formatted_text.each do |line|
      if line.size / num > 0
        0.upto(line.size / num) do |term|
          lines << line[num*term..num*(term+1)-1]
        end
      else
        lines << line
      end
    end
    @processed_text = lines.join('<br>')
  end
end
