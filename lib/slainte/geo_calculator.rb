module Slainte
  module GeoCalculator
    EARTH_RADIUS_KM = 6371.00

    def distance_in_km(from_lat:, from_long:, to_lat:, to_long:)
      source_lat = from_lat.to_f
      source_lng = from_long.to_f
      destination_lat = to_lat.to_f
      destination_lng = to_long.to_f

      distance_in_radius(source_lat, source_lng, destination_lat, destination_lng) * EARTH_RADIUS_KM
    end

    private
      def distance_in_radius(source_lat, source_lng, destination_lat, destination_lng)
        d_lat = (source_lat - destination_lat).to_radians;
        d_lng = (source_lng - destination_lng).to_radians;
        a = Math.sin(d_lat/2)**2 + Math.cos(source_lat.to_radians) * Math.cos(destination_lng.to_radians) * Math.sin(d_lng/2) ** 2

        2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
      end
  end
end
