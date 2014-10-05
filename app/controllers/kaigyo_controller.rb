class KaigyoController < ApplicationController
  def index
    if params[:data]
      lines = []
      text = params[:data][:text].strip.gsub("\n", "").gsub("\r", "")
      num = params[:data][:num].to_i
      0.upto(text.size / num) do |term|
        lines << text[num*term..num*(term+1)-1].strip
      end
      @processed_text = lines.join("<br>")
    end
    # a
  end

end
