module Slainte
  class Inviter
    def self.run(path:, distance: 100)
      input = read_file(path)

      records = CustomersParser.run(input)
      customers = Customers.new(records)
      customers_to_invite = customers.within_distance of: distance

      print_customers customers_to_invite
    end

    private
      def self.read_file(path)
        File.read(path)
      end

      def self.print_customers(customers)
       puts customers.each { |customer| customer.to_s }
      end
  end
end
