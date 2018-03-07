module Slainte
  # Main inviter calss, responsible to output list of matching customers to invite
  #
  # Arguments:
  #   path: File path to customers list
  #   distance: Distance filter, defaults to 100km
  class Inviter
    attr_accessor :path, :distance

    def initialize(path:, distance: 100)
      @path = path
      @distance = distance
    end

    def run(presenter: Slainte::TerminalPresenter)
      input = read_file(path)
      presenter.new(customers_to_invite(input, distance)).render
    end

    private
      def read_file(path)
        File.read(path)
      end

      def customers_to_invite(input, distance)
        records = CustomersParser.run(input)
        customers = Customers.new(records)

        customers.within(distance: distance)
      end
  end
end
