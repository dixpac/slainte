module Slainte
  # Main inviter calss, responsible to output list of matching customers to invite
  #
  # Arguments:
  #   path: File path to customers list
  #   distance: Distance filter, defaults to 100km
  class Inviter
    attr_accessor :path, :distance

    def initialize(path:, distance: nil)
      @path = path
      @distance = distance
    end

    def run(presenter: Slainte::TerminalPresenter)
      presenter.new(customers_to_invite(input)).render
    end

    private
      def customers_to_invite(input)
        @_customers_to_invite ||= customers.within(distance: distance)
      end

      def customers
        @_customers ||= Customers.new(records)
      end

      def records
        @_records ||= CustomersParser.run(input)
      end

      def input
        @_input ||= read_file(path)
      end

      def read_file(path)
        File.read(path)
      end
  end
end
