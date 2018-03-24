class LikeATree
  def initialize(height)
    raise ArgumentError.new 'Height must be positive' if height < 0
    @height = nearest_whole_number height
  end

  # Draws the entire tree.
  def draw
    lines = []

    indent = @height - 1
    draw_braches(lines, indent)

    lines
  end

  private

  # The branches of the tree.
  def draw_braches(lines, indent, stars = 1)
    while indent >= 0 do
      lines << (' ' * indent) + ('*' * stars)
      indent -= 1
      stars  += 2
    end
  end

  def nearest_whole_number(num)
    num.round
  end
end
