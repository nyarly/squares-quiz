

class Squares
  def initialize(num)
    @number = num
    @rows = [[1]]
    @index = 2
  end

  def output
    size = Math::sqrt(@number)
    raise "Not a square number" unless size ** 2 == @number
    compute_spiral

    return formatted
  end

  def formatted
    col_width = Math::log10(@number).ceil
    @rows.map do |row|
      row.map do |num|
        num.to_s.ljust(col_width)
      end.join(" ")
    end.join("\n") + "\n"
  end

  def compute_spiral
    while(@index < @number)
      go_up
      go_left
      break unless @index < @number
      go_down
      go_right
    end
  end

  def go_up
    @rows.reverse.each do |row|
      row.push(@index)
      @index += 1
    end
  end

  def go_left
    @rows.unshift((@index..(@index+@rows.length)).to_a.reverse)
    @index += @rows.length
  end

  def go_down
    @rows.each do |row|
      row.unshift(@index)
      @index += 1
    end
  end

  def go_right
    @rows.push((@index..(@index+@rows.length)).to_a)
    @index += @rows.length
  end
end
