module Slainte
  # Container for customers that we get from file. Converts input hash to SortedSet.
  # This way we discard duplicates and keep data always sorted by user_id
  class Customers
    include GeoCalculator

    attr_reader :data, :records

    def initialize(data = {})
      @data = data
      @records = SortedSet.new

      load_into_sorted_set
    end

    # Filters customers within specified distance, and returns SortedSet of matching
    # customers. To perform distance calculation uses GeoCalculator mixin.
    #
    # Arguments:
    #   distance: Distance in km to filter customers
    #   of: Base distance calculation point, defaults to DUBLIN_OFFICE location.
    def within(distance:, of: DUBLIN_OFFICE)
      records.find_all do |record|
        resulting_distance = distance_in_km(from_lat: of[:latitude], from_long: of[:longitude],
          to_lat: record.latitude, to_long: record.longitude)

        resulting_distance <= distance
      end
    end

    private
      def load_into_sorted_set
        data.each do |record|
          new_customer = Customer.new(record[:user_id], record[:name], record[:latitude], record[:longitude])
          records.add new_customer
        end
      end
  end
end
