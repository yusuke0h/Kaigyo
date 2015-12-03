class Word
  def initialize(params)
    @length = params[:num]
    @text = params[:text]
    self
  end

  def length_of_line
    @length.to_i == 0 ? 30 : @length.to_i
  end

  def format_text
    @formatted_text =
      @text
      .strip
      .split("\n")
    self
  end

  def push_to_lines
    @formatted_text.map { |line| line.scan(/.{1,#{@length}}/) }
      .flatten
      .join('<br>')
  end
end
