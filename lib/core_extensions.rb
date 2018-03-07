# Add ability to convert numbers to radians
class Numeric
  RADIAN_PER_DEGREE = Math::PI / 180.0

  def to_radians
    self * RADIAN_PER_DEGREE
  end
end
