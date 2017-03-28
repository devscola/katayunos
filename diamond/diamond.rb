def diamond_for(letter)
  if letter == 'A'
    "#{letter}\n"
  elsif letter == 'B'
    builder = DiamondBuilder.new(letter)
    builder.build
  else
    "  A\n B B\n#{letter}   #{letter}\n B B\n  A\n"
  end
end

class DiamondBuilder
  SPACE = " "
  NEW_LINE = "\n"

  def initialize(letter)
    @letter = letter
  end

  def build
    result = first_half + middle_line + second_half
    remove_trailing_spaces_from(result) + NEW_LINE
  end

  private

  def first_half
    ('A'...@letter).map do |current_letter|
      build_line_for(current_letter)
    end.join
  end

  def middle_line
    @letter + gap + @letter
  end

  def gap
    gap_width = @letter.ord - 'A'.ord
    SPACE * gap_width
  end

  def second_half
    first_half.reverse
  end

  def build_line_for(current_letter)
    padding_width = @letter.ord - current_letter.ord
    padding = SPACE * padding_width
    padding + current_letter + padding + NEW_LINE
  end

  def remove_trailing_spaces_from(result)
    result.split(NEW_LINE).map{ |l| l.rstrip }.join(NEW_LINE)
  end
end
