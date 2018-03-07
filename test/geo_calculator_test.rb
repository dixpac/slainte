require "test_helper"

class GeoCalculatorTest < Minitest::Test
  class Dummy
    extend Slainte::GeoCalculator
  end

  def test_distance_in_km_returns_distance_in_km_from_specified_points
    distance = Dummy.distance_in_km(from_lat: 53.339428, from_long: -6.257664,
      to_lat: 52.986375, to_long: -6.043701)

    assert_equal 43.32733774201503, distance
  end

  def test_distance_in_km_raises_exception_if_required_params_are_missing
    assert_raises ArgumentError do
      Dummy.distance_in_km(from_lat: 0)
    end
  end
end
