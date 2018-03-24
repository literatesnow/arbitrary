# Draws an X.
class XMarksTheSpot
  def initialize(height)
    raise ArgumentError.new 'Height must be positive' if height < 0
    @height  = nearest_odd_number height
    @width   = @height * 2

    @padding = 3 # Minimum space between last line
  end

  # Draws the X.
  def draw
    spot_legs + spot_middle + spot_legs.reverse
  end

  private

  #
  # The legs of the X.
  # *       *
  #   *   *
  def spot_legs
    lines = []
    indent = 0
    spacer = @width - @padding

    draw_legs(lines, indent, spacer)
    lines
  end

  #
  # The dot in the middle.
  #     *
  def spot_middle
    indent = (@width - 1) / 2
    [ draw_line(indent, nil) ]
  end

  def draw_legs(lines, indent, spacer)
    while spacer > 0 do

      lines << draw_line(indent, spacer)

      indent += @padding - 1
      spacer =  @width - (indent * 2) - @padding
    end
  end

  def draw_line(indent, spacer)
    str =  (' ' * indent) + '*'
    str += (' ' * spacer) + '*' unless spacer.nil?
    str
  end

  def nearest_odd_number(num)
    num.round
    num += 1 if num % 2 == 0
    num
  end
end

