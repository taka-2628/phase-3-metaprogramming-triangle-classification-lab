class Triangle
  attr_reader :one, :two, :three

  def initialize(one, two, three)
    @one = one
    @two = two
    @three = three
  end

  def kind
    validate_triangle
    if one == two && two == three
      :equilateral
    elsif one == two || two == three || one == three
      :isosceles
    else
      :scalene
    end
  end

  def validate_triangle
    if one * two * three <= 0
      raise TriangleError
    elsif (one + two <= three) || (two + three <= one) || (one + three <= two)
      raise TriangleError
    end
  end

  class TriangleError < StandardError
  end
end

# class Triangle
#   attr_reader :one, :two, :three

#   def initialize(one, two, three)
#     @one = one
#     @two = two
#     @three = three
#   end

#   def kind
#     validate_triangle
#     if one == two && two == three
#       :equilateral
#     elsif one == two || two == three || one == three
#       :isosceles
#     else
#       :scalene
#     end
#   end

#   def validate_triangle
#     real_triangle = [(one + two > three), (one + three > two), (two + three > one)]

#     [one, two, three].each do |side|
#       real_triangle << false if side <= 0 
#     end

#     raise TriangleError if real_triangle.include?(false)
#   end

#   class TriangleError < StandardError
#   end
# end