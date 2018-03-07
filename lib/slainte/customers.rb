module Slainte
  class Customers
    extend GeoCalculator
    include GeoCalculator

    attr_reader :data, :records

    def initialize(data = {})
      @data = data
      @records = SortedSet.new

      load_into_sorted_set
    end

    def within_distance(of: 100)
      matches = records.find_all do |record|
        resulting_distance = distance_in_km(from_lat: office_location[:latitude],
          from_long: office_location[:longitude], to_lat: record.latitude, to_long: record.longitude)

        resulting_distance <= of
      end
    end

    private
      def load_into_sorted_set
        data.each do |record|
          new_customer = Customer.new(record[:user_id], record[:name], record[:latitude], record[:longitude])
          records.add new_customer
        end
      end

      def office_location
        dublin_lat = 53.339428
        dublin_long = -6.257664

        { latitude: dublin_lat , longitude: dublin_long}
      end
  end
end
