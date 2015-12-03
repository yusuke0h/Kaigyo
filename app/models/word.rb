class Word
  def initialize(data)
    @length = data[:num]
    @text = data[:text]
  end

  def format
    to_a
    to_s
  end

  private

  def to_a
    @lines =
      @text
      .strip
      .split("\n")
  end

  def to_s
    @lines
      .map { |line| line.scan(/.{1,#{@length}}/) }
      .flatten
      .join('<br>')
  end
end
