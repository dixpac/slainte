module Slainte
  class LocationFilter
    attr_accessor :customers

    def initialize(customers)
      @customers = customers
    end

    def within(distance: 100)
      matches = customers.find_all do |customer|
        customer_location = { latitude: customer.latitude, longitude: customer.longitude }
        resulting_distance = DistanceCalculator.distance_in_km(office_location, customer_location)

        resulting_distance <= distance
      end
    end
  end
end
