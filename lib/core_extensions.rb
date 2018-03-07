# Add ability to convert float value to radians
class Float
  RADIAN_PER_DEGREE = Math::PI / 180.0

  def to_radians
    self * RADIAN_PER_DEGREE
  end
end

