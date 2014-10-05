class KaigyoController < ApplicationController
  def index
    if params[:data]
      num = params[:data][:num].to_i
      if num == 0
        num = 30
      end

      lines = []
      text = params[:data][:text].strip.gsub("\r", "")
      text.split("\n").each do |line|
        if line.size / num > 0
          0.upto(line.size / num) do |term|
            lines << line[num*term..num*(term+1)-1]
          end
        else
          lines << line
        end
      end
      @processed_text = lines.join("<br>")
    end
  end

end



      # text.split(/^$/).each do |line|
      #   line = line.gsub("\n", "")
      #   if line.size / num > 0
      #     0.upto(line.size / num) do |term|
      #       lines << line[num*term..num*(term+1)-1].strip
      #     end
      #   else
      #     lines << line.strip
      #   end
      # end

      # 0.upto(text.size / num) do |term|
      #   lines << text[num*term..num*(term+1)-1].strip
      # end