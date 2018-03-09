module Slainte
  # Checks whether specific customer is eligiable for invite.
  # Under the hood uses GeoLocation mixin to calculate the distance.
  class CustomerEligableForInviteRule
    include GeoCalculator

    DUBLIN_OFFICE = { latitude: 53.339428, longitude: -6.257664 }

    attr_accessor :customer, :distance, :from

    def initialize(customer:, distance:, from:)
      @customer = customer
      @distance = distance || 100
      @from = from || DUBLIN_OFFICE
    end

    def satisfied?
      distance_from_base <= distance
    end

    private
      def distance_from_base
        distance_in_km(from_lat: from[:latitude], from_long: from[:longitude],
          to_lat: customer.latitude, to_long: customer.longitude)
      end
  end
end
